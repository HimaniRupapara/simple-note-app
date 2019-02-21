class HomeController < ApplicationController
layout 'home'
  def home
  end
  def dashboard
    render :layout => 'user'
  end
end
