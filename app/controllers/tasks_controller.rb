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
    @task = Task.new(tasks_params)
    @task.save

    redirect_to tasks_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end
end
