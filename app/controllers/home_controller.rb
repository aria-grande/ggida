class HomeController < ApplicationController
  def index
    @manager = current_manager
  end

  def introduce
  end

  def guide
  end
end
