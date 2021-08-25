class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
  ALGORITHM_TYPE = 'HS256'.freeze


  def self.call(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: exp }
    JWT.encode(payload, SECRET_KEY, ALGORITHM_TYPE)
  end

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end