class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
      result = Sessions::Authenticator.run(
        params[:email],
        params[:password],
        Sessions::TokenEncoder
      )
      # if result.success?
      #   @user = User.find_by_email(params[:email])
      #   render json: {token: result.fixtures['token'], user: @user, status: :ok}
      # else
      #   render json: { error: result.message }, status: :unauthorized
      # end
      case result.code
      when :success
        render json: {token: result.fixtures['token'], user: result.fixtures['user'], exp: result.fixtures['exp']}
      when :invalid
        render json: { error: "Check your credentials" }, status: :unauthorized
      end
  end
  private

  def login_params
    params.permit(:email, :password)
  end
end