class UsersController < ApplicationController
  before_action :set_liff_id, only: %i[new]
  skip_before_action :login_required
  before_action :set_search

  def new; end

  # JSからリクエストされると実行
  def create
    id_token = params[:idToken]
    channel_id = ENV['LIFF_CHANNEL_ID']
    line_user_id = LiffInterface.new(id_token, channel_id).exam
    user = User.find_by(line_user_id: line_user_id)
    user = User.create!(line_user_id: line_user_id) if user.nil?
    session[:user_id] = user.id
  end
end
