class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update)

  def new
  end

  def create
    party = Party.create(party_params)
    unless party.valid?
      respond_to do |f|
        f.html render :new
        f.json render json: {error: party.errors.full_messages}, status: :bad_request
      end
    end
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
    params.require(:party).permit(:title, :contents, :place, :contact_number, :contact_email, :address, :state,
                                  :start_date, :min_participants, :max_participants, :price, :images_file_name,
                                  :images_content_type, :images_file_size, :applier_name)
  end
end
