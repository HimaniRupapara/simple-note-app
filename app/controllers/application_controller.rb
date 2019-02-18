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
      # home_dashboard_path
      note_comments_path(:note_id => User.find(current_user.id).notes.first.id)
    else
      root_path
    end
  end
end
