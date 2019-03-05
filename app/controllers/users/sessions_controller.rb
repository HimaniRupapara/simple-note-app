# frozen_string_literal: true
# layout 'home'
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    redirect_to root_path
    set_flash_message(:error, :invalid)
  end

  # POST /resource/sign_in
  def create
  resource = User.find_for_database_authentication(email: params[:user][:email])
      return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      if resource.confirmed?
        sign_in :user, resource
        redirect_to home_dashboard_path
      else
        redirect_to root_path
        set_flash_message(:error, :unconfirmed)
      end
    else
      redirect_to root_path
      set_flash_message(:error, :invalid)
    end
  end

  def invalid_login_attempt
    redirect_to root_path
    set_flash_message(:error, :invalid)
  end



    # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
