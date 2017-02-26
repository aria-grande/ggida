class HomeController < ApplicationController
  def index
    @manager = current_manager
  end

  def introduce
    @kitchens = Kitchen.all
  end

  def guide
  end
end
