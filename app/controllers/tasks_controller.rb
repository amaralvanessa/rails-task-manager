class TasksController < ApplicationController

  before_action :fetch_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(update_task_params)

    redirect_to @task
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def create_task_params
    params.require(:task).permit(:title, :details)
  end

  def update_task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end
end
