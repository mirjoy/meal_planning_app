class BannedFood < ActiveRecord::Base
	has_many :user_banned_foods
	has_many :users, through: :user_banned_foods

	validates :name, presence: true, uniqueness: true

	before_validation :downcase_name
	before_validation :singularize_name

	before_save :fill_blank_spaces

	def downcase_name
		self.name = self.name.downcase if self.name
	end

	def singularize_name
		self.name = self.name.singularize if self.name
	end

	def fill_blank_spaces
		self.name = self.name.gsub(" ", "%20")
	end
end
