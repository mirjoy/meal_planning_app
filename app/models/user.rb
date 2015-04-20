class User < ActiveRecord::Base
	has_secure_password

	validates :user_name, presence: true, uniqueness: true
end
