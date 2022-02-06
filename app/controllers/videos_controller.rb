class VideosController < ApplicationController
  skip_before_action :login_required
  before_action :set_search
  before_action :set_liff_id
  before_action :current_user

  def index; end

  def show
    @video = Video.find(params[:id])
    gon.video = @video
  end
end
