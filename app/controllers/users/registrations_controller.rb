# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :check_for_share_note, only: [:create]



  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)

   resource.save
   yield resource if block_given?
   if resource.persisted?
     if resource.active_for_authentication?
       redirect_to root_path
       set_flash_message(:error, :invalid)

       # respond_with resource, location: after_sign_up_path_for(resource)
     else
       # set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
       # expire_data_after_sign_in!
       # respond_with resource, location: after_inactive_sign_up_path_for(resource)
       redirect_to root_path
       set_flash_message(:notice, :signed_up_but_unconfirmed)

     end
   else
     # clean_up_passwords resource
     # set_minimum_password_length

     redirect_to root_path
     set_flash_message(:error, :already_existence)

   end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
  #
  # def account_update_params
  #     devise_parameter_sanitizer.sanitize(:account_update)
  #   end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
    def after_update_path_for(resource)
      home_dashboard_path
    end



  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   request.referrer
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
