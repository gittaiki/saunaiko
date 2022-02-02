class VideosController < ApplicationController
  before_action :set_search, only: %i[index show]

  def index
    watch_videos = Watch.where(user_id: current_user.id).count
    total_videos = Video.count
    @progress_percent = watch_videos.to_f / total_videos * 100
  end

  def show
    @video = Video.find(params[:id])
    gon.youtube_id = @video.youtube_id
  end
end
