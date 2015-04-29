class Cuisine < ActiveRecord::Base
  has_many :user_cuisines
  has_many :users, through: :user_cuisines

  validates :name, presence: true
end
