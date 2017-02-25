class ManagersController < ApplicationController

  before_action :authenticate_user!

  def parties
    @parties = Party.pending_approval.order(id: :desc)
  end
  def judge
    @party = Party.find_by_id(params[:id])
  end
  def result
    party = Party.find_by_id(params[:id])
	party.state = Integer(params[:state])
    party.save()

	if (party.state == "deny")
	    PartyMailer.deny_party(party).deliver_now
	else
	    PartyMailer.allow_party(party).deliver_now
	end
    redirect_to :action => :parties
  end
end
