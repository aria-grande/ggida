class PartyMailer < ApplicationMailer
  default from: 'from@example.com'

  def request_party(party)
  	@party = party
    mail(to: "thediputs@gmail.com", subject: "[개설신청]" + party["title"])
  end
end
