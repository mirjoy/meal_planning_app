class User < ActiveRecord::Base
  has_secure_password
  
  before_save { self.email = email.downcase }
  VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, with: VALID_REGEX, on: :create
  validates :email, presence: true, uniqueness: true                  
  validates :user_name, presence: true

  # def create_reset_digest
  #   self.reset_token = User.new_token
  #   update_attribute(:reset_digest, User.digest(reset_token))
  #   update_attribute(:reset_sent_at, Time.zone.now)
  # end

  # def send_password_reset_email
  #   UserMailer.password_reset(self).deliver_now
  # end

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, 
                                  uid: data.uid)

    #if user.new? can i call a conditional here?
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

  private

  def downcase_email
    self.email = email.downcase
  end

  # def create_activation_digest
  #   self.activation_token  = User.new_token
  #   self.activation_digest = User.digest(activation_token)
  # end
end
