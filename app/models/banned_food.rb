class BannedFood < ActiveRecord::Base
	has_many :user_banned_foods
	has_many :users, through: :user_banned_foods

	validates :name, presence: true, uniqueness: true

	before_validation :downcase_name
	before_validation :singularize_name

	def downcase_name
		self.name = self.name.downcase
	end

	def singularize_name
		self.name = self.name.singularize
	end
end
