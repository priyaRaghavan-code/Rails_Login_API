class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'Not Found!' }
  end

  def authorize_request
    # header = request.headers['Authorization']
    # header = header.split(' ').last if header
    # begin
    #   @decoded = JsonWebToken.decode(header)
    #   @current_user = User.find(@decoded[:user_id])
    # rescue ActiveRecord::RecordNotFound => e
    #   render json: { errors: e.message }, status: :unauthorized
    # rescue JWT::DecodeError => e
    #   render json: { errors: e.message }, status: :unauthorized
    # end
    byebug
    puts(request.headers['Authorization'])
    result = Sessions::TokenVerifier.run(
      request.headers['Authorization'],
      Sessions::TokenEncoder
    )
    # render json: { errors: result.message }, status: :unauthorized unless result.success?
    if result.success?
      byebug
      render json: result.fixtures['bool_time']
    else
      byebug
      # render json: { error: 'unauthorized' }, status: :unauthorized
      render json: { error: result.message }, status: :unauthorized
    end
  end
  
end

