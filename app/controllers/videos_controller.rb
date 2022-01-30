class VideosController < ApplicationController
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).page(params[:page])
    watch_videos = Watch.where(user_id: current_user.id).count.to_f
    total_videos = Video.count.to_f
    @progress_percent = watch_videos / total_videos * 100
  end

  def show
    @video = Video.find(params[:id])
    gon.youtube_id = @video.youtube_id
  end
end
