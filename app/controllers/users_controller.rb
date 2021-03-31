class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @tasks = Task.where(operator_id: current_user.id)
    @schedules = Schedule.where(user_id: current_user.id)
    @totals = Total.where(user_id: current_user.id)
  end
end
