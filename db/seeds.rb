class Seeds
	def create
		generate_users
		generate_specific_users
		generate_allergies
		generate_diets
	end

	def generate_users
		20.times do
      user = User.create(
        user_name: Faker::Name.first_name,
        provider: "Facebook",
        email: Faker::Internet.email,
      )
    end
    p 'Users Created'
	end

	def generate_allergies
		%w(Dairy Egg Gluten Peanut Seafood Sesame Soy Sulfite Tree Nut Wheat).each do |allergy|
			Allergy.create(name: allergy)
		end
	end

	def generate_diets
		%w(Lacto-vegetarian Ovo-vegetarian Pescetarian Vegan Vegetarian).each do |diet|
			Diet.create(name: diet)
		end
	end

	def generate_specific_users
		User.create(
			user_name: "miriam",
			provider: "Facebook",
			email: "miriam@example.com",
			)
	end

	 def self.create
      new.create
   end
end

Seeds.create