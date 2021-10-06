class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  # before_action :current_cart,  except: :authorize_request

  # before_action :current_cart, except: :authorize_request

  def not_found
    render json: { error: 'Not Found!' }
  end

  def authorize_request
    result = Sessions::TokenVerifier.run(
      request.headers['Authorization'],
      Sessions::TokenEncoder
    )
    if result.success?
      render json: result.fixtures['bool_time']
    else
      render json: { error: result.message }, status: :unauthorized
    end
  end
end