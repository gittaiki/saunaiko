class VideosController < ApplicationController
  before_action :set_search, only: %i[index show]

  def index; end

  def show
    @video = Video.find(params[:id])
    gon.youtube_id = @video.youtube_id
  end
end
