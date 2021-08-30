class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_email(params[:email])
    # byebug
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      # render json: @user, status: :created
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @user.name , email:@user.email, username:@user.username}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
      # render json: { errors: @user.errors },
            #  status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
