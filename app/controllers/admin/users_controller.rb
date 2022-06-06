class Admin::UsersController < Admin::BaseController
  skip_before_action :login_required
  skip_before_action :check_admin
  before_action :set_admin_liff_id, only: %i[new]

  def new; end

  def create
    id_token = params[:idToken]
    channel_id = ENV['ADMIN_LIFF_CHANNEL_ID']
    line_user_id = LiffInterface.new(id_token, channel_id).exam
    user = User.find_by(line_user_id: line_user_id)
    session[:user_id] = user.id
  end
end
