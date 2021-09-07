class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def login
      result = Sessions::Authenticator.run(
        params[:email],
        params[:password],
        Sessions::TokenEncoder
      )
      if result.success?
        render json: result.fixtures['token']
      else
        render json: { error: result.message }, status: :unauthorized
      end
  end
  private

  def login_params
    params.permit(:email, :password)
  end
end