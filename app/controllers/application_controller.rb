class ApplicationController < ActionController::Base
  layout "home"
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

  def after_sign_in_path_for(resource)
    if current_user
      load_sidebar
      notes_path
    else
      root_path
    end
  end


  def load_sidebar
    @notes = current_user.notes.all
  end

end
