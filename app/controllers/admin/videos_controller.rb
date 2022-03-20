class Admin::VideosController < Admin::BaseController
  def index
    @q = Video.ransack(params[:q])
    videos = @q.result(distinct: true)
    @videos = Kaminari.paginate_array(videos).page(params[:page])
  end

  def show
    @video = Video.find(params[:id])
    gon.video = @video
  end

  def new
  end

  def edit
  end
end
