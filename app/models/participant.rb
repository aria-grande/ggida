# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  phone      :string(255)      not null
#  party_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :integer          default("init")
#

class Participant < ApplicationRecord
  belongs_to :party

  enum state: {
      init: 0, # 초기 상태(승인 대기 중)
      accepted: 1, # 승인
      rejected: 2 # 거절
  }

  before_save :send_email_when_approved

  before_save :check_seat_availability_in_the_party

  protected

  def send_email_when_approved
    if state_changed? && accepted?
      ParticipantMailer.approved_email(self).deliver_now
    end
  end

  def check_seat_availability_in_the_party
    return unless state_changed?
    if accepted? && party.left_seats == 1
      party.done!
    elsif rejected? && party.left_seats.zero?
      party.accepting!
    end
  end
end
