FactoryBot.define do
  factory :user do
    name { 'user1' }
    username { 'user1' }
    password { 'User@123' }
    password_confirmation { 'User@123' }
    email { 'user1@gmail.com' }
  end
end