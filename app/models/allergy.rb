class Allergy < ActiveRecord::Base
	has_many :user_allergies
	has_many :users, through: :user_allergies

	validates :name, presence: true
end