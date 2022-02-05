class VideosController < ApplicationController
  # skip_before_action :login_required, only: %i[show]
  before_action :set_search
  before_action :set_liff_id

  def index; end

  def show
    @video = Video.find(params[:id])
    gon.video = @video
  end
end
