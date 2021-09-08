module Sessions
  class TokenEncoder
    
    SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
    ALGORITHM_TYPE = 'HS256'.freeze
    # extend Callable
    # def encode(user_id:,opts: {})
    #   byebug
    #     payload = opts.merge({ user_id: user_id})
    #     JWT.encode(payload, SECRET_KEY, ALGORITHM_TYPE)
    # end
    
    def self.encode(opts)
      byebug
      # payload = opts.merge({ user_id: user_id})
      # puts(payload)
      JWT.encode(opts, SECRET_KEY)
    end

    # def self.encode(payload, exp = 24.hours.from_now)
    #   payload[:exp] = exp.to_i
    #   JWT.encode(payload, SECRET_KEY)
    # end
    byebug

    def self.decode(token)
      byebug
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
