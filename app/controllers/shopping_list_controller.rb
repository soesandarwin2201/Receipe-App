class ShoppingListController < ApplicationController
  def index
    # to show the recipe of the current user
    @recipes = Recipe.where(user_id: current_user.id)
    # get the foodlist of the recipe
    @recipe_foods = RecipeFood.where(recipe_id: @recipes.ids)
    # general food
    @foods = Food.where(id: @recipe_foods.pluck(:food_id))
  end
end
