class PartyMailer < ApplicationMailer
  default from: 'noreply@ggida.org'

  def request_party(party)
  	@party = party
    mail(to: "ggida.lab@gmail.com", subject: "[개설신청]" + party.title)
  end
  
  def deny_party(party)
  	@party = party
    mail(to: party.contact_email, subject: "[개설반려]" + party.title)
  end

  def allow_party(party)
  	@party = party
    mail(to: party.contact_email, subject: "[개설승인]" + party.title)
  end
end
