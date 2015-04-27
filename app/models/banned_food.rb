class BannedFood < ActiveRecord::Base
	has_many :user_banned_foods
	has_many :users, through: :user_banned_foods

	validates :name, presence: true

	before_save :downcase_name
	before_save :singularize_name

	def downcase_name
		self.name.downcase!
	end

	def singularize_name
		self.name = self.name.singularize
	end
end
