class StudentsController < ApplicationController
  before_action :find_one, except: [:create, :index]

  def index
    @students = Student.all
    render json: @students, status: :ok
  end

  def show
    render json: @student, status: :ok
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: { errors: @student.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: { errors: @student.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private

  def find_one
    @student = Student.find(params[:id])
    
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Student not found' }, status: :not_found
  end

  def student_params
    params.required(:name)
    params.permit(
      :name,
      :last_name,
      :email,
      :phone,
      :address,
      :user_id
    )
  end
end
