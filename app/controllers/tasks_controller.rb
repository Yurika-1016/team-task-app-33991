class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all.order(start_time: 'ASC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    redirect_to tasks_path unless (current_user.id == @task.user_id) || (current_user.id == @task.operator_id)
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    redirect_to tasks_path unless (current_user.id == @task.user_id) || (current_user.id == @task.operator_id)
    @task.destroy
    redirect_to tasks_path
  end

  def search
    @tasks = Task.search(params[:keyword])
  end

  def search_created_at
    @tasks = Task.all.order(created_at: 'ASC')
  end

  def search_dead_line_date
    @tasks = Task.all.order(dead_line_date: 'ASC')
  end

  private

  def task_params
    params.require(:task).permit(:name, :time_required_id, :start_time, :dead_line_date,
                                 :operator_id).merge(user_id: current_user.id)
  end
end
