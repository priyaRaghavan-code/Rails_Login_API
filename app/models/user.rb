class User < ApplicationRecord
  has_secure_password
  # validates_presence_of :email
  # validates_uniqueness_of :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/i

  validates :email, presence: true, length: { maximum: 300 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :password, presence: true,format: { with: VALID_PASSWORD_REGEX }
end
