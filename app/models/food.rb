class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_food
end