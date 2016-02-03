class ClassroomController < ApplicationController

  def get_roster
    @course = Course.where(id: params[:course_id])
    render json: @course, :include => :students
  end

  def get_coursework
  	@course = Course.where(id: params[:course_id])
    render json: @course, :include => :tasks
  end

  private

  # def allowed_params
  #   params.require(:course).permit(:name, :number, :section)
  # end

end