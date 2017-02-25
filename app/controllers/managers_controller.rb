class ManagersController < ApplicationController

  before_action :authenticate_user!

  def parties
    @parties = Party.pending_approval
  end
  def judge
    @party = Party.find_by_id(params[:id])
  end
end
