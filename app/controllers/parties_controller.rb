class PartiesController < ApplicationController
  def index
    @parties = Party.all
    render 'parties/index'
  end
end
