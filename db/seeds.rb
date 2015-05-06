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
		Allergy.create(name: "Dairy", meta_value: "396^Dairy-Free")
		Allergy.create(name: "Gluten", meta_value: "393^Gluten-Free")
		Allergy.create(name: "Peanut", meta_value: "394^Peanut-Free")
		Allergy.create(name: "Sesame", meta_value: "399^Sesame-Free")
		Allergy.create(name: "Soy", meta_value: "400^Soy-Free")
		Allergy.create(name: "Sulfite", meta_value: "401^Sulfite-Free")
		Allergy.create(name: "Tree Nut", meta_value: "395^Tree Nut-Free")
		Allergy.create(name: "Wheat", meta_value: "392^Wheat-Free")
	end

	def generate_diets
		Diet.create(name: "Paleo", meta_value: "403^Paleo")
		Diet.create(name: "Lacto-vegetarian", meta_value: "388^Lacto%20vegetarian")
		Diet.create(name: "Ovo-vegetarian", meta_value: "389^Ovo%20vegetarian")
		Diet.create(name: "Pescetarian", meta_value: "390^Pescetarian")
		Diet.create(name: "Vegan", meta_value: "386^Vegan")
		Diet.create(name: "Vegetarian", meta_value: "387^Lacto-ovo%20vegetarian")
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