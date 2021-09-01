module Sessions
  class TokenEncoder
    
    SECRET_KEY = Rails.application.secrets.secret_key_base.freeze
    ALGORITHM_TYPE = 'HS256'.freeze
    # extend Callable
    # byebug
    # def call(user_id:,opts: {})
    #   byebug
    #     payload = opts.merge({ user_id: user_id})
    #     JWT.encode(payload, SECRET_KEY, ALGORITHM_TYPE)
    # end

    def encode(user_id: ,opts: {})
      byebug
      payload = opts.merge({ user_id: user_id})
      JWT.encode(payload, SECRET_KEY)
    end

    # def self.encode(payload, exp = 24.hours.from_now)
    #   payload[:exp] = exp.to_i
    #   JWT.encode(payload, SECRET_KEY)
    # end

    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
