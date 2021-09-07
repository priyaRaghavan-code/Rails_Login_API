module Sessions
  class Authenticator < Actionable::Action
    # extend Callable
    step :find_user
    step :authenticate
    step :generate_token

    byebug
    def initialize(
      email,
      password,
      jwt_encoder = Sessions::TokenEncoder
    )
      @_email= email
      @_password = password
      @_jwt_encoder = jwt_encoder
      @token = nil
      @exp = nil
      puts("email",@_email)
    end

    private
    def find_user
      byebug
      puts(@user,"Current user")
      @user = User.find_by  email: @_email
      unless @user
        fail!(
          :find_user,
          "Failed: No user found"
        )
      end
    end

    def authenticate
      result = @user&.authenticate(@_password)
      unless result
        fail!(
          :authenticate,
          "Failed: Unable to verify credentails"
        )
      end
    end

    def generate_token
      @exp = 24.hours.from_now.to_i
      @token = @_jwt_encoder.encode( exp: @exp , data: { user_id: @user.id} ) 
    end
  end
end