class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update)

  def new
    @kitchens = Kitchen.all
  end

  def create
    kitchen = Kitchen.find_by_id(party_params[:kitchenId])
    raise Exceptions::DefaultError, {msg: 'kitchenId is empty', status_code: :bad_request} if kitchen.nil?

    party = Party.new(party_params.except(:kitchenId))
    party.place = kitchen.name
    party.address = kitchen.address
    raise Exceptions::DefaultError, {msg: party.errors.full_messages.first, status_code: :bad_request} unless party.valid?

    party.save
    # PartyMailer.request_party(party).deliver_now
    head :ok
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

  protected

  def party_params
    params.require(:party).permit(:title, :contents, :kitchenId, :contact_number, :contact_email, :state,
                                  :start_date, :min_participants, :max_participants, :price, :images, :applier_name, :category)
  end
end
