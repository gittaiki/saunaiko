class StaticPagesController < ApplicationController
  skip_before_action :login_required, only: %i[top]

  def top; end
end
