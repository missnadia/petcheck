class User < ActiveRecord::Base

  has_many :pets

  has_secure_password
end
