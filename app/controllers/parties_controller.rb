class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update show)

  def new
    @kitchens = Kitchen.all
  end

  def create
    party = params.require(:party).permit!
    party["state"] = 0
    kitchen = Kitchen.find_by_id(party.kitchenId)
    party["place"] = kitchen.name
    party["address"] = kitchen.address

    Party.create!(party)
#    new PartyMailer.request_party(party).deliver_now
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
