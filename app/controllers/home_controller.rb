class HomeController < ApplicationController
  def index
    @manager = current_manager
  end
end
