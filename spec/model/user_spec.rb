require 'spec_helper'
describe User do
  context 'validation tests' do
    it 'ensures password presence' do
      user = User.create(email: 'Sample@gmail.com')
      expect(user).to_not be_valid
    end

    it 'ensures email presence' do
      user = User.create(password: '1234')
      expect(user).to_not be_valid
    end

    it 'ensures email format' do
      user = User.create(email: 'Sample',password:'1234',password_confirmation: '1234')
      expect(user).to_not be_valid
    end

    it 'ensures password presence' do 
      user = User.create(email: 'Sample@gmail.com')
      expect(user).to_not be_valid
    end

    it 'ensures password length' do
      user = User.create(email: 'sample@gmail.com',password:'1234',password_confirmation: '1234')
      expect(user).to_not be_valid
    end

    it 'ensures both password and confirm password matches' do
      user = User.create(email: 'sample@gmail.com',password:'1234@abc',password_confirmation: '1234')
      expect(user).to_not be_valid
    end

    it 'ensures both password and confirm password matches' do
      user = User.create(email: 'sample@gmail.com',password:'1234@abc',password_confirmation: '1234@abc')
      expect(user).to be_valid
    end
  end
end