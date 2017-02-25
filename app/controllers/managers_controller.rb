class ManagersController < ApplicationController

  before_action :authenticate_user!

  def parties
    @parties = Party.pending_approval
  end
  def judge
    @party = Party.find_by_id(params[:id])
  end
  def result
    party = Party.find_by_id(params[:id])
	party.state = Integer(params[:state])
    party.save()
    
    redirect_to :action => :parties
  end
end
