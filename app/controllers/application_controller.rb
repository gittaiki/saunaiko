class ApplicationController < ActionController::Base
  before_action :login_required

  private

  def set_liff_id
    gon.liff_id = ENV['LIFF_ID']
  end

  def login_required
    redirect_to top_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
