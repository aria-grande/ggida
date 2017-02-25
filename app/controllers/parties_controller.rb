class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update show)

  def new
  end

  def create
  	party = params.require(:party).permit!
  	party["state"] = 1
    party["contents"] = 'conetents of the party'
    party["place"] = 'startup campus'
    party["contact_number"] = '01011111111'
    party["contact_email"] = 'test@ggida.org'
    party["address"] = 'South Korea'
    party["min_participants"] =  3
    party["max_participants"] =  5
    party["start_date"] =  Time.zone.now
	
    Party.create!(party)
  end

  def update
    super
  end

  def index
    @parties = Party.where.not(state: :pending_approval).order(id: :desc)
  end

  def show
    @party = Party.find_by_id(params[:id])
  end
  
  def edit
    @party = Party.find_by_id(params[:id])
  end
end
