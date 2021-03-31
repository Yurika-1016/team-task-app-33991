class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @scheduleで今日で登録してあるスケジュールを取得（テーブルがUTCのためyesterdayで取得）
    @schedules = Schedule.where('start_time >= ?', Date.yesterday)
    # 今月で登録されている勤務時間(totalテーブルデータ)を取得
    @totals = Total.where(start_time: Time.current.all_month)
    # start_timeが今日で登録されているデータを取得
    @tasks = Task.where(start_time: Time.current.all_day)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    redirect_to user_path unless current_user.id == @schedule.user_id
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :time_limit_id).merge(user_id: current_user.id)
  end
end
