module Sessions
  class TokenVerifier < Actionable::Action
    # Steps
    # initialize
    step :parse_header
    step :parse_token
    step :verify # not sure if token is expired or blacklisted
  end
end
