OmniAuth.config.logger = Rails.logger

# always ask for authorization so i can find the pain point
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['facebook_key'], ENV['facebook_secret']	
end