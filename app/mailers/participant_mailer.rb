class ParticipantMailer < ApplicationMailer
  default from: 'noreply@ggida.org'

  def approved_email(participant)
    @participant = participant
    mail(to: @participant.email, subject: '[안내] 모임 참가 확정')
  end
end
