class UserBannedFood < ActiveRecord::Base
	belongs_to :user
	belongs_to :banned_food
end