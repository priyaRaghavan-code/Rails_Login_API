module Sessions
  class Authenticator < Actionable::Action
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
      @_jwt_encoder = jwt_encoder
      @token = nil
      @exp = nil
      puts("email",@_email)
    end

    private
    def find_user
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
          :invalid,
          @user.errors.full_messages.join(", ")
        )
      end
      # result = {
      #   status: 'success'
      # }
    end

    def generate_token
      @exp = 24.hours.from_now.to_i
      @token = @_jwt_encoder.encode( exp: @exp , data: { user_id: @user.id} ) 
    end
  end
end