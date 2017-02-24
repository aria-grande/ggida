class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to :root unless manager_signed_in?
  end
end
