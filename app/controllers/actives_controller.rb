class ActivesController < ApplicationController
  skip_before_action :login_required, only: %i[show]
  before_action :set_search

  def index
    @actives = current_user.actives.all
  end

  def new
    @active = Active.new
  end

  def create
    @active = current_user.actives.build(active_params)
    if @active.sauna_minute >= 6
      @active.score = case @active.sauna_minute
                      when 6
                        @active.score + 1
                      when 7
                        @active.score + 2
                      when 8
                        @active.score + 3
                      when 9
                        @active.score + 4
                      when 10
                        @active.score + 6
                      when 11
                        @active.score + 8
                      else
                        @active.score + 10
                      end
    end
    if @active.water_bath_minute >= 1
      @active.score = case @active.water_bath_minute
                      when 1
                        @active.score + 7
                      else
                        @active.score + 10
                      end
    end
    if @active.break_minute >= 5
      @active.score = case @active.break_minute
                      when 5
                        @active.score + 1
                      when 6
                        @active.score + 3
                      when 7
                        @active.score + 5
                      when 8
                        @active.score + 7
                      when 9
                        @active.score + 9
                      else
                        @active.score + 10
                      end
    end
    if @active.cycle_count >= 2
      @active.score = case @active.water_bath_minute
                      when 2
                        @active.score + 5
                      else
                        @active.score + 10
                      end
    end
    if @active.save
      redirect_to actives_path, success: 'サ活を記録しました'
    else
      flash.now[:danger] = 'サ活を記録できませんでした'
      render :new
    end
  end

  def show
    @active = Active.find(params[:id])
  end

  private

  def active_params
    params.require(:active).permit(:visited_on, :sauna_minute, :water_bath_minute, :break_minute,
                                   :cycle_count).merge(score: 60)
  end
end
