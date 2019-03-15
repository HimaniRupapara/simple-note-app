class ApplicationController < ActionController::Base

  layout "home"
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:autosave, :profile,:email,:password_confirmation, :password, :current_password)}
  end

  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end

  private
  def another_by_method
    if current_user.nil?
      render :layout => "home"
    else
      render :layout => "user"
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def check_for_share_note
    @sharenote=SharedNote.find_by(email: params[:user][:email])
    if @sharenote != nil
      @msg=Note.find(@sharenote.note_id).title + " note shared by " + @sharenote.user.email
      EmailJob.perform_later @msg ,params[:user][:email]
    end
  end

end
