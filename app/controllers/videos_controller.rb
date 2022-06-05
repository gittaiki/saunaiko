class VideosController < ApplicationController
  skip_before_action :login_required
  before_action :set_search, only: %i[index show]
  before_action :set_liff_id, only: %i[show]
  before_action :current_user

  def index; end

  def show
    @video = Video.find(params[:id])
    gon.video = @video
    # Youtube動画情報を取得
    @youtube = OembedInterface.new(@video).response
  end

  def bookmarks
    @q = current_user.bookmark_videos.ransack(params[:q])
    @bookmark_videos = @q.result(distinct: true).page(params[:page])
  end
end
