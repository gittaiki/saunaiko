class VideosController < ApplicationController
  def index
    @videos = case params[:level]
              when 'basic'
                Video.basic
              when 'advanced'
                Video.advanced
              else
                Video.entry
              end
  end
end
