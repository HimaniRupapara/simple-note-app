# frozen_string_literal: true
# layout 'home'
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    flash[:errors] = "login failed!"
    # yield resource if block_given?
    # respond_with(root_path, serialize_options(resource))
    redirect_to root_path
  end

  # POST /resource/sign_in
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      # respond_to do |format|
      #   format.html
      #   format.js
      redirect_to home_dashboard_path 
      # note_comments_path(:note_id => User.find(current_user.id).notes.first.id), turbolinks: false}
      # end
    end
  end

  def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    render json: flash[:alert], status: 401
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
