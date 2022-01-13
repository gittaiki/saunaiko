class VideosController < ApplicationController
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).page(params[:page])
  end

  def show
    @video = Video.find(params[:id])
  end
end