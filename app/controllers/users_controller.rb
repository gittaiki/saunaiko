class UsersController < ApplicationController
  before_action :set_liff_id, only: %i[new]
  skip_before_action :login_required
  before_action :set_search

  def new; end

  # JSからリクエストされると実行
  def create
    id_token = params[:idToken]
    channel_id = ENV['LIFF_CHANNEL_ID']
    params = { 'id_token' => id_token, 'client_id' => channel_id }
    uri = URI.parse('https://api.line.me/oauth2/v2.1/verify')
    # IDトークンを検証し、ユーザーの情報を取得
    res = Net::HTTP.post_form(uri, params)
    # LINEユーザーIDを取得
    line_user_id = JSON.parse(res.body)['sub']
    user = User.find_by(line_user_id: line_user_id)
    user = User.create!(line_user_id: line_user_id) if user.nil?
    session[:user_id] = user.id
  end
end
