class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find_by_id(params[:id])
  end

end
