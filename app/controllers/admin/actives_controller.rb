class Admin::ActivesController < Admin::BaseController
  before_action :authorize_active

  def index
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @actives = Active.where(visited_on: @month.all_month).order(visited_on: :desc).page(params[:page])
  end

  def destroy
    @active = Active.find(params[:id])
    @active.destroy!
    redirect_to admin_actives_path, success: 'サ活の記録を削除しました'
  end

  private

  def authorize_active
    authorize(Active)
  end
end
