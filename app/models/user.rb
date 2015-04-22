class User < ActiveRecord::Base
	validates :user_name, presence: true

	def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, 
                                  uid: data.uid)
      
    user.provider = data.provider
    user.uid = data.uid
    user.user_name = data.info.name
    user.token = data.credentials.token
    user.expires_at = Time.at(data.credentials.expires_at)
    user.email = data.email
    user.save

    return user
  end
end
