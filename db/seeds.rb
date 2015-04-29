class Seeds
	def create
		generate_users
		generate_specific_users
		generate_allergies
		generate_diets
		generate_cuisines
	end

	def generate_users
		20.times do
      user = User.create(
        user_name: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password"
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

	def generate_cuisines
		["American", "Italian", "Asian", "Mexican", "Southern & Soul Food", "French", "Southwestern", "Barbecue", "Indian", "Chinese", "Cajun & Creole", "English", "Mediterranean", "Greek", "Spanish", "German", "Thai", 
				"Moroccan", "Irish", "Japanese", "Cuban", "Hawaiin", "Swedish", "Hungarian", "Portugese"].each do |cuisine|
			Cuisine.create(name: cuisine)
		end
	end

	def generate_specific_users
		User.create(
			user_name: "miriam",
			email: "miriam@example.com",
			password: "password",
			password_confirmation: "password"
			)
	end

	 def self.create
      new.create
   end
end

Seeds.create