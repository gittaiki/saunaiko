class WatchesController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    current_user.watch(@video)
  end

  def destroy
    @video = current_user.watches.find(params[:id]).video
    current_user.unwatch(@video)
  end
end
