# == Schema Information
# Schema version: 20170225051301
#
# Table name: parties
#
#  id                  :integer          not null, primary key
#  title               :string(255)      not null
#  contents            :string(255)      not null
#  place               :string(255)      not null
#  contact_number      :string(255)      not null
#  contact_email       :string(255)
#  address             :string(255)      not null
#  state               :integer          default("pending_approval"), not null
#  start_date          :datetime         not null
#  min_participants    :integer
#  max_participants    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  price               :integer          default(0)
#  images_file_name    :string(255)
#  images_content_type :string(255)
#  images_file_size    :integer
#  images_updated_at   :datetime
#  applier_name        :string(255)      not null
#  type                :string(255)
#

class Party < ApplicationRecord
  has_many :participants
  
  has_attached_file :images, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png",
                    :path => ":rails_root/public/upload/images/:id_:style_:filename",
                    :url => "/upload/images/:id_:style_:filename"
  validates_attachment_content_type :images, :content_type => /^image\/(jpeg|png|gif|tiff)$/

  validates_attachment_size :images, :in => 0..10.megabytes

  validate :check_done_condition

  validates :title, :contents, :place, :contact_number, :contact_email, :address, :state, :start_date, :min_participants, :max_participants, :price, presence: true

  validates :contact_email, email: true

  attr_reader :left_seats

  scope :will_done, -> (expire_date) { where('state = 1 and start_date <= ?', expire_date)}

  enum state: {
      deny: -1, # 거절
      pending_approval: 0, # 승인 대기 중
      accepting: 1, # 모집중
      done: 2 # 모집 완료
  }

  def left_seats
    max_participants - participants.accepted.count
  end

  class << self
    def make_done_after_start_date
      Party.will_done(Time.zone.now.end_of_day).map(&:done!)
    end
  end


  protected

  def check_done_condition
    if state_changed? && state_was.eql?('accepting') && done? && start_date <= Time.zone.now
      false
    else
      true
    end
  end
end
