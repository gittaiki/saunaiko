class Admin::UsersController < Admin::BaseController
  skip_before_action :login_required
  skip_before_action :check_admin
  before_action :set_admin_liff_id, only: %i[new]

  def new; end

  def create
    id_token = params[:idToken]
    channel_id = ENV['ADMIN_LIFF_CHANNEL_ID']
    params = { 'id_token' => id_token, 'client_id' => channel_id }
    uri = URI.parse('https://api.line.me/oauth2/v2.1/verify')
    res = Net::HTTP.post_form(uri, params)
    line_user_id = JSON.parse(res.body)['sub']
    user = User.find_by(line_user_id: line_user_id)
    session[:user_id] = user.id
  end
end
