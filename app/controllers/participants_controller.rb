class ParticipantsController < ApplicationController
  before_action :authenticate_user!, only: %i(index show update)

  def new
  end

  def index
    @party = Party.find_by_id(params[:party_id])
    @participants = Party.find_by_id(params[:party_id]).participants
  end

  def update
    Participant.find_by_id(params[:id]).update(state: participant_params[:state])
  end

  def show
    @participant = Participant.find_by_id(params[:id])
  end

  def create
    raise Exceptions::DefaultError, {msg: 'participant 생성에 실패', status_code: :server_error} unless Participant.create!(participant_params)
    head :ok
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :phone, :state, :party_id)
  end
end
