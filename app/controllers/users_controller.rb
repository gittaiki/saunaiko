class UsersController < ApplicationController
  before_action :set_liff_id, only: %i[new]
  skip_before_action :login_required
  before_action :set_search

  def new; end

  # JSから/usersのmethod: 'POST'でリクエストされると実行する
  def create
    # JSからのbodyに代入されたidTokenを取得
    id_token = params[:idToken]
    channel_id = ENV['LIFF_CHANNEL_ID']
    # HTTPリクエスト
    params = { 'id_token' => id_token, 'client_id' => channel_id }
    uri = URI.parse('https://api.line.me/oauth2/v2.1/verify')
    # 検証が成功すると、変数resにユーザーの情報が代入される
    res = Net::HTTP.post_form(uri, params)
    # LINEユーザーIDを取得
    line_user_id = JSON.parse(res.body)['sub']
    user = User.find_by(line_user_id: line_user_id)
    # DBにuserが保存されていなければユーザー登録する
    user = User.create!(line_user_id: line_user_id) if user.nil?
    session[:user_id] = user.id
  end
end
