class VideosController < ApplicationController
  skip_before_action :login_required
  before_action :set_search, only: %i[index show]
  before_action :set_liff_id, only: %i[show]
  before_action :current_user

  def index; end

  def show
    @video = Video.find(params[:id])
    gon.video = @video
    # Youtube動画のタイトルとチャンネル名を取得
    oembed_url = URI.parse("https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=#{@video.youtube_id}&format=json")
    res = Net::HTTP.get_response(oembed_url)
    @title = JSON.parse(res.body)['title']
    @author_name = JSON.parse(res.body)['author_name']
  end

  def bookmarks
    @q = current_user.bookmark_videos.ransack(params[:q])
    @bookmark_videos = @q.result(distinct: true).page(params[:page])
  end
end
