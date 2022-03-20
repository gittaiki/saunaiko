class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path, warning: '権限がありません' unless current_user.admin?
  end

  def set_admin_liff_id
    gon.liff_id = ENV['ADMIN_LIFF_ID']
  end
end
