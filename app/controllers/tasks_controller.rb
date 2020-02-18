class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @completed = @task.completed ? 'This task is completed' : 'This task is not completed yet'
  end

  def new
  end

  def create
    safe_params = params.require(:task).permit(:title, :details, :completed)
    Task.create(safe_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    safe_params = params.require(:task).permit(:title, :details, :completed)
    @task.update(safe_params)
    redirect_to task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end
end
