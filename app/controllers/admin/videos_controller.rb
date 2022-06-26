class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :authorize_video

  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).page(params[:page])
  end

  def show
    gon.video = @video
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_videos_path, success: '動画を追加しました'
    else
      flash.now[:danger] = '動画を追加できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @video.update(video_params)
      redirect_to admin_video_path(@video), success: '動画を更新しました'
    else
      flash.now[:danger] = '動画を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @video.destroy!
    redirect_to admin_videos_path
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:youtube_id, :address, :sauna)
  end

  def authorize_video
    authorize(Video)
  end
end
