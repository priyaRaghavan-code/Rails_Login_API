require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users' do
    it 'Registers the user' do
      post '/users', params: { name: 'sameple2', email: 'sample2@gmail.com',username: 'sample2', password: 'Sample@123', password_confirmation:'Sample@123' } 
      puts(response.body)
      expect(response).to have_http_status(:ok)
    end

    it 'Registers the user with invalid params' do
      post '/users', params: { name: 'sameple2' ,username: 'sample2', password: 'Sample@123', password_confirmation:'Sample@123' } 
      expect(response).to have_http_status(:unauthorized)
    end
  end
end