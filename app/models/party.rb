# == Schema Information
#
# Table name: parties
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  contents         :string(255)      not null
#  place            :string(255)      not null
#  contact_number   :string(255)      not null
#  contact_email    :string(255)
#  address          :string(255)      not null
#  state            :integer          default("pending_approval"), not null
#  start_date       :datetime         not null
#  min_participants :integer
#  max_participants :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  price            :integer          default(0)
#

class Party < ApplicationRecord
  has_many :participants
  
  has_attached_file :images, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png",
                    :path => "public/upload/images/:id_:style_:filename"
  validates_attachment_content_type :images, :content_type => /^image\/(jpeg|png|gif|tiff)$/
  validates_attachment_size :images, :in => 0..10.megabytes

  scope :will_done, -> (expire_date) { where('state = 1 and start_date <= ?', expire_date)}

  enum state: {
      pending_approval: 0, # 승인 대기 중
      accepting: 1, # 모집중
      done: 2 # 모집 완료
  }

  class << self
    def make_done_after_start_date
      Party.will_done(Time.zone.now.end_of_day).map(&:done!)
    end
  end
end
