class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login


  def login
      byebug
      result = Sessions::Authenticator.run(
        params[:email],
        params[:password],
        Sessions::TokenEncoder
      )
      if result.success?
        render json: result.fixtures['token']
      else
        byebug
        render json: { error: 'unauthorized' }, status: :unauthorized
        render json: { error: result.message }, status: :unauthorized
      end
  end
  private

  def login_params
    params.permit(:email, :password)
  end
end


# def login
#   byebug
#   # byebug
#     result = Sessions::Authenticator.run(
#       email: params[:email],
#       password: params[:password],
#       jwt_encoder: Sessions::NewTokenEncoder,
#     )
#     if result.success?
#       render json: result.fixtures['token']
#     else
#       render json: { error: 'unauthorized' }, status: :unauthorized
#       render json: { error: result.message }, status: :unauthorized
#     end
# end

