class StaticPagesController < ApplicationController
  skip_before_action :login_required
  before_action :set_search

  def top; end

  def terms; end

  def policy; end
end
