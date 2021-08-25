require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users' do
    it 'Registers the user' do
      post '/users', params: { name: 'sameple2', email: 'sample2@gmail.com',username: 'sample2', password: 'Sample@123', password_confirmation:'Sample@123' } 
      puts(response.body)
      expect(response).to have_http_status(:created)
    end

    it 'Registers the user with invalid params' do
      post '/users', params: { name: 'sameple2' ,username: 'sample2', password: 'Sample@123', password_confirmation:'Sample@123' } 
      puts(response.body)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
