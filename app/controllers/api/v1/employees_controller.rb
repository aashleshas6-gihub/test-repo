class Api::V1::EmployeesController < ApplicationController
  before_action :set_department

  def index
    @employees = @departemt.employees
    render json: @employees , status: 'ok'
  end

  def create
    @employee =  @departemt.employees.new(employees_params)
    if emp.save
        render json: @employee , status: 'created'
    else
        render json: @employee.errors , status: 'unprocssable_entity'
    end
  end

  def show
    emp = @departemt.employees.find(params[:id])
    render json: emp , status: 'ok'
  end

  private
  def set_department
    @departemt = Department.find(params[:department_id])
  end

  def employees_params
    params.require(:employee).permit(:name, :email)
  end
end
