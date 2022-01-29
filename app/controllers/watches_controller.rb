class WatchesController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    current_user.watch(@video)
    redirect_back fallback_location: root_path
  end

  def destroy
    @video = current_user.watches.find(params[:id]).video
    current_user.unwatch(@video)
    redirect_back fallback_location: root_path
  end
end
