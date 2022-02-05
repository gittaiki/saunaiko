class ProfilesController < ApplicationController
  before_action :set_search
  before_action :set_liff_id

  def show
    @watch_videos = Watch.where(user_id: current_user.id).count
    total_videos = Video.count
    @progress_percent = @watch_videos.to_f / total_videos * 100
  end
end