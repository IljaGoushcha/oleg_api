class TasksController < ApplicationController

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
    if @task
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def create
    @task = Task.new(allowed_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(allowed_params)
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    params.require(:task).permit(:course_id, :name, :task_type, :max_points, :weight)
  end

end