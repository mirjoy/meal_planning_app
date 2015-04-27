class BannedFood < ActiveRecord::Base
	has_many :user_banned_foods
	has_many :users, through: :user_banned_foods

	validates :name, presence: true
end
