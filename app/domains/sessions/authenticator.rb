module Sessions
  class Authenticator < Actionable::Action
    # extend Callable
    step :find_user
    step :authenticate
    step :generate_token

    def initialize(
      email,
      password,
      jwt_encoder = Sessions::TokenEncoder
    )
      @_email= email
      @_password = password
      @_jwt_encoder = @jwt_encoder
      @token = nil
      puts("email",@_email)
    end

    private
    def find_user
      byebug
      @user = User.find_by email: @_email
      puts(@user,"Current user")
      unless @user
        fail!(
          :find_user,
          "Failed: No user found"
        )
      end
    end

    def authenticate
      byebug
      result = @user&.authenticate(params[:password])
      unless result
        fail!(
          :authenticate,
          "Failed: Unable to verify credentails"
        )
      end
    end

    def generate_token
      byebug
      @token = @jwt_encoder.encode(user_id: @user.id,  exp: Time.now + 24.hours.to_i ) 
      # @token = @jwt_encoder.encode(user_id: @user.id) # this fails
    end

    # def authenticate_1
    #   # Business logic for authentication
    #   @user = User.find_by email: @email # if @user is blank?
    #   raise Exception.new("Failed: No user found")
    #   @user&.authenticate(params[:password]) # if this fails
    #   @jwt_encoder.encode(user_id: @user.id, { exp: Time.now+24.hours.to_i }) # this fails
    # end
  end
end