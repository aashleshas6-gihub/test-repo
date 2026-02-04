class Api::V1::DepartmentsController < ApplicationController
  
	def index
    @departments = Department.all
    render json: @departments, status: 'ok'
  end

  def create
    dept = Department.new(dept_params)
    if dept.save
      render json: dept, status: 'created'
    else
      render json: dept.errors.full_messages, status: :unprocessible_entity
    end
  end

  def show
    dept = Department.find(params[:id])
    render json: dept, status: 'ok'
  end

  private
  def dept_params
    params.require(:departments).permit(:name)
  end
end
