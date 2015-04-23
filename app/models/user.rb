class User < ActiveRecord::Base
  has_secure_password
  
  validates :user_name, presence: true

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, 
                                  uid: data.uid)
    user.provider = data.provider
    user.uid = data.uid
    user.user_name = data.info.name
    user.token = data.credentials.token
    user.expires_at = Time.at(data.credentials.expires_at)
    user.email = data.info.email
    user.save(validate: false)

    return user
  end

  def not_registered_with_facebook?
    provider.nil?
  end
end
