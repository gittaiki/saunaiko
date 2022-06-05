class LineBotsController < ApplicationController
  skip_before_action :login_required
  # CSRF対策を無効化
  protect_from_forgery except: [:callback]

  def callback
    LineBotInterface.new(request).reply
    head :ok
  end
end
