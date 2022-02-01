class VideosController < ApplicationController
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).page(params[:page])
    watch_videos = Watch.where(user_id: current_user.id).count
    total_videos = Video.count
    @progress_percent = watch_videos.to_f / total_videos.to_f * 100
  end

  def show
    @video = Video.find(params[:id])
    gon.youtube_id = @video.youtube_id
  end
end
