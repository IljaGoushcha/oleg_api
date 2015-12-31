class EnrollmentsController < ApplicationController

  def index
    @enrollments = Enrollment.all
    render json: @enrollments
  end

  def show
    @enrollment = Enrollment.find(params[:id])
    if @enrollment
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # def create
  #   @course = Course.new(allowed_params)

  #   if @course.save
  #     render json: @course, status: :created, location: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   @course = Course.find(params[:id])

  #   if @course.update(allowed_params)
  #     render json: @course, status: :created, location: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @course = Course.find(params[:id])

  #   if @course.destroy
  #     render json: @course, status: :created, location: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end


  private

  def allowed_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end

end