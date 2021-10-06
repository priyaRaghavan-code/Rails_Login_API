class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  def create
    byebug
    result = Users::Registration.run(user_params) 
    case result.code
    when :success
      byebug
      render json: result.fixtures['user']
    when :invalid
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(
      :name, :username, :email, :password, :password_confirmation
    )
  end

end