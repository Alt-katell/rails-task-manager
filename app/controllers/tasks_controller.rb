class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @completed = @task.completed ? 'This task is completed' : 'This task is not completed yet'
  end

  def new
    @task = Task.new
  end

  def create
    safe_params = params.require(:task).permit(:title, :details, :completed)
    Task.create(safe_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    safe_params = params.require(:task).permit(:title, :details, :completed)
    @task.update(safe_params)
    redirect_to task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def find_task
    @task = Task.find(params[:id])
  end
end
