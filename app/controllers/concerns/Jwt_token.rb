require "jwt"

module JwtToken

  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.credentials.secret_key_base. to_s

  def self.jwt_encode(payload, exp: 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HasWithIndifferentAccess.new decoded
  end

end