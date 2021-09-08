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
    @bool_time = false
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
      puts(@decoded)
    end
    
    
    
    def verify
      byebug
      @exp_time = Time.at(@decoded[:exp])
      current_time = Time.now
      if @exp_time > current_time
        @bool_time = true
      end
      
    end

  end
end
