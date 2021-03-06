class ActivesController < ApplicationController
  before_action :set_search
  before_action :set_liff_id, only: %i[index]

  def index
    @views = WatchDecorator.decorate(Watch.total(current_user.id))
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    actives = current_user.actives.where(visited_on: @month.all_month)
    @actives_chart = actives.chart_order
    @actives = actives.order(visited_on: :desc).page(params[:page])
  end

  def new
    @active = Active.new
  end

  def create
    @active = current_user.actives.build(active_params)
    if @active.valid?
      sauna_score if @active.sauna_minute >= 6
      water_bath_score if @active.water_bath_minute >= 1
      cycle_score if @active.cycle_count >= 2
    end
    if @active.save
      redirect_to actives_path, success: "サ活を記録しました。ととのい度「#{@active.score}」です。"
    else
      flash.now[:danger] = 'サ活を記録できませんでした'
      render :new
    end
  end

  def destroy
    @active = Active.find(params[:id])
    @active.destroy!
    redirect_to actives_path, success: 'サ活の記録を削除しました'
  end

  private

  def active_params
    params.require(:active).permit(:visited_on, :sauna_minute, :water_bath_minute,
                                   :break_minute, :cycle_count).merge(score: 60)
  end

  def sauna_score
    @active.score = case @active.sauna_minute
                    when 6..8
                      @active.score + 4
                    when 9..11
                      @active.score + 8
                    else
                      @active.score + 10
                    end
  end

  def water_bath_score
    @active.score = case @active.water_bath_minute
                    when 1
                      @active.score + 7
                    else
                      @active.score + 10
                    end
  end

  def cycle_score
    @active.score = case @active.cycle_count
                    when 2
                      @active.score + 10
                    else
                      @active.score + 20
                    end
  end
end
