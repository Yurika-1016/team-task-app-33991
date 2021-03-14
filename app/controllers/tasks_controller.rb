class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(implementation_date: 'ASC')
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
    params.require(:task).permit(:name, :time_required_id, :implementation_date, :dead_line_date,
                                 :operator_id).merge(user_id: current_user.id)
  end
end
