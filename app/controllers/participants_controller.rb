class ParticipantsController < ApplicationController
  before_action :authenticate_user!, only: %i(index show update)

  def new
  end

  def index
    @participants = Party.find_by_id(params[:party_id]).participants
  end

  def update
    Participant.find_by_id(params[:id]).update(state: participant_params[:state])
  end

  def show
    @participant = Participant.find_by_id(params[:id])
  end

  def create
    Participant.create!(participant_params)
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :phone, :state, :party_id)
  end

end
