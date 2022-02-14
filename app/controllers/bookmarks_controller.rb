class BookmarksController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    current_user.bookmark(@video)
  end

  def destroy
    @video = current_user.bookmarks.find(params[:id]).video
    current_user.unbookmark(@video)
  end
end
