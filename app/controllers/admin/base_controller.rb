class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'
  add_flash_types :success, :danger

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_admin_liff_id
    gon.liff_id = ENV['ADMIN_LIFF_ID']
  end
end
