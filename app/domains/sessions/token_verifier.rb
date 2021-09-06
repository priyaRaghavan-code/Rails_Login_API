module Sessions
  class TokenVerifier < Actionable::Action
    # Steps
    # initialize
    step :parse_header
    step :parse_token
    step :verify # not sure if token is expired or blacklisted

    byebug
    def initialize(
      header,
      jwt_decoder = Sessions::TokenEncoder
    )
    @_header = header
    @_jwt_decoder = jwt_decoder
    @decoded = nil
    @current_user = nil
    end

    def parse_header
      byebug
      @_header = @_header.split(' ').last 
      unless @_header
        fail!(
          :parse_header,
          "Failed: User is not authorized"
        )
      end
    end

    def parse_token
      byebug
      @decoded = @_jwt_decoder.decode(@_header)
    end
    
    
    
    def verify
      puts(@decoded,"Decoded detail")
      # puts(@decoded[data])
      puts("Exp",User.find(@decoded[:user_id]))

      @current_user = User.find(@decoded[:user_id])
      byebug
      puts(@current_user)
    end

  end
end
