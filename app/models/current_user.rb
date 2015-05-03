class CurrentUser 
	attr_reader :user

	def initialize(user)
		@user = user || Guest.new
	end

	def nav
		user.nil? || "layouts/user_navbar"
	end

	# def meta_methods(*args)
	# 	args.each do |action|
	# 		define_method(action) do
	# 			user.action
	# 		end
	# 		binding.pry
	# 	end
	# end

	# meta_methods("banned_foods", "id", "meals", "user_name", "email", "phone_number")

	def banned_foods
		user.banned_foods
	end

	def id
		user.id
	end

	def meals
		user.meals
	end

	def user_name
		user.user_name
	end

	def email
		user.email
	end

	def phone_number
		user.phone_number
	end

	def errors
		user.errors
	end
end