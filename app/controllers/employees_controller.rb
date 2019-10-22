class EmployeesController < ApplicationController
  before_action :find_one, except: %i[create index]

  def index
    @employees = Employee.all
    render json: @employees, status: :ok
  end

  def show
    render json: @employee, status: :ok
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: :created
    else
      render json: { errors: @employee.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: { errors: @employee.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  end

  private

  def find_one
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Employee not found' }, status: :not_found
  end

  def employee_params
    params.required(:name)
    params.permit(
      :name,
      :last_name,
      :email,
      :phone,
      :address,
      :start_date,
      :salary,
      :rol,
      :user_id
    )
    
  end
end
