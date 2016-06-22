class User < ActiveRecord::Base
  has_secure_password
  validates :password, numericality: {greater_than: 7}
end
