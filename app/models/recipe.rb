class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_food
  has_many :foods, through: :food_recipes
end
