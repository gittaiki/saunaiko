class ActivesController < ApplicationController
  # skip_before_action :login_required, only: %i[show]
  before_action :set_search
  before_action :set_liff_id, only: %i[show]

  def show
    @views = WatchDecorator.decorate(Watch.total(current_user.id))
    @actives = current_user.actives
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @actives_chart = @actives.visited_month(@month)
  end

  def new
    @active = Active.new
  end

  def create
    @active = current_user.actives.build(active_params)
    sauna_score if @active.sauna_minute >= 6
    water_bath_score if @active.water_bath_minute >= 1
    cycle_score if @active.cycle_count >= 2
    if @active.save
      redirect_to actives_path, success: 'サ活を記録しました'
    else
      flash.now[:danger] = 'サ活を記録できませんでした'
      render :new
    end
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
