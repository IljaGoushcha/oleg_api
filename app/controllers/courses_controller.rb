class CoursesController < ApplicationController

  def index
    @courses = Course.all
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])
    # if @course
    #   render json: @course, status: :created, location: @course
    # else
    #   render json: @course.errors, status: :unprocessable_entity
    # end
    if @course
      render json: @course
    else
      render json: @course.errors, status: :bad_request
    end
  end

  def create
    @course = Course.new(allowed_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(allowed_params)
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    params.require(:course).permit(:name, :number, :section)
  end

end