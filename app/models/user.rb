class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/i

  validates :email, presence: true, length: { maximum: 300 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :password, presence: true,format: { with: VALID_PASSWORD_REGEX }
end
