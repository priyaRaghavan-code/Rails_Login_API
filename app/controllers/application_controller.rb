class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'Not Found!' }
  end

  def authorize_request
    puts(request.headers['Authorization'])
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

