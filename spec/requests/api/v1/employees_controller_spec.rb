require 'rails_helper'

RSpec.describe "Api::V1::EmployeesController", type: :request do
  let!(:dept) { Department.create!( name: 'HR')}
  let!(:employee) { Employee.create!( name: 'abc', email: 'abc@example.com', department_id: dept.id)}

  describe "GET /index" do
    it 'return all employees' do
      get "/api/v1/departments/#{dept.id}/employees"
      expect(response).to have_http_status('ok')
      expect(JSON.parse(response.body).first["name"]).to eq('abc')      
    end
  end

  describe "GET /show" do
    it 'return employee data' do
      get "/api/v1/departments/#{dept.id}/employees/#{employee.id}"
      expect(response).to have_http_status('ok')
      expect(JSON.parse(response.body)["name"]).to eq('abc')      
    end
  end
end
 