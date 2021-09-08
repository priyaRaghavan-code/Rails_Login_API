require 'rails_helper'
RSpec.describe "Authentications", type: :request do
  describe 'POST auth/login' do
    let(:user) { create(:user) }

    it 'authenticates the user' do
      post '/auth/login', params: { email: user.email, password: 'User@123'}
      expect(response).to have_http_status(:ok)
    end

    it 'returns error when email does not exist' do
     post '/auth/login', params: { email: 'ac@gmail.com', password: 'password' }
     expect(response).to have_http_status(:unauthorized)
    end

    it 'returns error when password is incorrect' do
      post '/auth/login', params: { username: user.email, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
    end
    
  end
end
