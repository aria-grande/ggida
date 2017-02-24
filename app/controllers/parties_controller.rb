class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create update)

  def new
  end

  def create
    Party.create!(params.require(:party))
  end

  def update
    super
  end

  def index
    @parties = Party.where.not(state: :pending_approval)
  end

  def show
    @party = Party.find_by_id(params[:id])
  end

end
