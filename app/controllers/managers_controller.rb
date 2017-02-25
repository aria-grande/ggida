class ManagersController < ApplicationController

  before_action :authenticate_user!

  def parties
    @parties = Party.pending_approval
  end
end
