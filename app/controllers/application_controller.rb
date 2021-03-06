require 'exceptions'
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  rescue_from Exceptions::DefaultError, with: :render_default_error

  def authenticate_user!
    redirect_to :new_manager_session unless manager_signed_in?
  end

  protected

  def render_default_error(exception)
    render json: { error: exception.message, code: exception.error_code, objects: exception.objects }, status: exception.status_code
  end
end
