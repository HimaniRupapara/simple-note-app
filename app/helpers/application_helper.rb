module ApplicationHelper


  # To make devise forms available anywhere.
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def notes_count
  @notes ||= current_user.notes.count
 end
end
