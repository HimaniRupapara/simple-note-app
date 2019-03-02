class HomeController < ApplicationController
  layout 'home'
  before_action :check_signed_in
  def home
  end
  def dashboard
    render :layout => 'user'
  end



def check_signed_in
  redirect_to home_dashboard_path if signed_in?
end
end
