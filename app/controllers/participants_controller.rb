class ParticipantsController < ApplicationController
  def new
  end

  def index
    @participants = Party.find_by_id(params[:party_id]).participants
  end

  def show
    @participant = Participant.find_by_id(params[:id])
  end

  def create
    Participant.create!(params.require(:participant))
  end
end
