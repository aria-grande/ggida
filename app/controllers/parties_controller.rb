class PartiesController < ApplicationController
  def new
  end

  def index
    @parties = Party.where.not(state: :pending_approval)
  end

  def show
    @party = Party.find_by_id(params[:id])
  end

end
