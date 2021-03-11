class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :time_required_id, :implementation_date, :dead_line_date,
                                 :operator_id).merge(user_id: current_user.id)
  end
end
