class ApplicationController < ActionController::Base
  before_action :login_required
  helper_method :current_user

  private

  def set_liff_id
    gon.liff_id = ENV['LIFF_ID']
  end

  def login_required
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_search
    @q = Video.ransack(params[:q])
    videos = @q.result(distinct: true).shuffle
    @videos = Kaminari.paginate_array(videos).page(params[:page])
  end
end
