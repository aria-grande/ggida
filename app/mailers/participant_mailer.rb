class ParticipantMailer < ApplicationMailer
  default from: 'from@example.com'

  def approved_email(participant)
    @participant = participant
    mail(to: @participant.email, subject: '[안내] 모임 참가 확정')
  end
end
