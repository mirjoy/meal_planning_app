OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['facebook_key'], ENV['facebook_secret']	
end