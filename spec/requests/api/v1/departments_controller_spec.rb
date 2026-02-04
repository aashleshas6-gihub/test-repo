require 'rails_helper'

RSpec.describe "Api::V1::DepartmentsController", type: :request do
  let!(:dept) { Department.create!(name: 'HR') }

  describe "GET /index" do
    it 'fetch all departemts' do
      get '/api/v1/departments'

      expect(response).to have_http_status('ok')
      expect(JSON.parse(response.body).first["name"]).to eq('HR')
    end
  end

  describe "Post /create" do
    it 'create new department' do
      new_params = {departments: {name: 'IT'}}
      post '/api/v1/departments', params: new_params 

      expect(response).to have_http_status('created')
      expect(JSON.parse(response.body)["name"]).to eq('IT')
    end
  end

  describe "GET /departments/:id" do
    it 'return a departemt' do
      get "/api/v1/departments/#{dept.id}"
      expect(response).to have_http_status('ok')
      expect(JSON.parse(response.body)["name"]).to eq('HR')
    end
  end
end
