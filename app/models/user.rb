class User < ActiveRecord::Base
	has_secure_password

	validates :user_name, presence: true

	def self.find_or_create_from_auth(data)
  	user = User.find_or_create_by(provider: data.provider, uid: data.uid)
      
      user.provider = auth.provider
      user.uid = auth.uid
      user.user_name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save

   return user
  end

end
