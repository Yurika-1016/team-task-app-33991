class TotalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @total = Total.new
  end

  def create
    @total = Total.new(total_params)
    if @total.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @total = Total.find(params[:id])
    redirect_to user_path unless current_user.id == @total.user_id
  end

  def update
    @total = Total.find(params[:id])
    if @total.update(total_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def total_params
    params.require(:total).permit(:start_time, :working_hour).merge(user_id: current_user.id)
  end
end
