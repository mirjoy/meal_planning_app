class Diet < ActiveRecord::Base
	has_many :user_diets
	has_many :users, through: :user_diets

  validates :name, presence: true
end