class StudentsController < ApplicationController

  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    if @student
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def create
    @student = Student.new(allowed_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(allowed_params)
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @student.destroy
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    params.require(:student).permit(:first_name, :last_name, :gender, :date_of_birth)
  end

end