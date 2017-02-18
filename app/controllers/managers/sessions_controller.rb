class Managers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end


  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password)
    end
  end

  def after_sign_in_path_for(_resource)
    stored_location_for(:manager) || root_path
  end

  def after_sign_out_path_for(_resource)
    new_manager_session_path
  end
end
