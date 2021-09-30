class ApplicationController < ActionController::API

  before_action :current_cart, except: :authorize_request

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

  def current_cart
    @current_cart ||= ShoppingCart.new((token: cart_token))
  end
  helper_method :current_cart

  private

  def cart_token
    return @cart_token unless @cart_token.nil?
    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end
end