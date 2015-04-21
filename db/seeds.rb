class Seeds
	def create
		generate_users
		generate_specific_users
	end

	def generate_users
		20.times do
      user = User.create(
        user_name: Faker::Name.first_name,
        provider: "Facebook",
        email: Faker::Internet.email,
        password: "password"
      )
    end
    p 'Users Created'
	end

	def generate_specific_users
		User.create(
			user_name: "miriam",
			provider: "Facebook",
			email: "miriam@example.com",
			password: "password"
			)
	end

	 def self.create
      new.create
   end
end

Seeds.create