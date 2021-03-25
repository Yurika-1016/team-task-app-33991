class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @schedules = Schedule.where('date >= ?', Date.yesterday)
    @totals = Total.where(date: Time.current.all_month)
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

  private

  def schedule_params
    params.require(:schedule).permit(:date, :time_limit_id).merge(user_id: current_user.id)
  end
end
