class ProfilesController < ApplicationController
  before_action :set_search
  before_action :set_liff_id

  def show
    @views = WatchDecorator.decorate(Watch.total(current_user.id))
  end
end
