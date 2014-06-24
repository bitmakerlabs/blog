class User < ActiveRecord::Base
  # attr_accessor :password, :password_confirmation

  has_secure_password

  # def authenticate
end
