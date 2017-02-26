class ManagersController < ApplicationController

  before_action :authenticate_user!

  def index
  	redirect_to '/managers/sign_in'
  end
  def parties
    @parties = Party.pending_approval.order(id: :desc)
  end

  def judge
    @party = Party.find_by_id(params[:id])
  end

  def result
    party = Party.find_by_id(params[:id])
	  party.state = params[:state].to_i
    party.save

    if party.deny?
        PartyMailer.deny_party(party).deliver_now
    elsif party.accepting?
        PartyMailer.allow_party(party).deliver_now
    end
    redirect_to :parties_managers
  end
end
