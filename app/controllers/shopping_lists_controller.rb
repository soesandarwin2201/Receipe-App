class ShoppingListsController < ApplicationController
    def index
      @recipes = current_user.recipes
      @general_food_list = current_user.foods
      @shopping_list = {}
      @total_items = 0
      @total_price = 0
  
      # Iterate over each recipe and compare its food list with the general food list
      @recipes.each do |recipe|
        missing_food = @recipes - @general_food_list
        unless missing_food.empty?
          missing_food.each do |food|
            # Add the missing food item to the shopping list
            @shopping_list[food.name] ||= { quantity: 0, price: food.price }
            @shopping_list[food.name][:quantity] += recipe.recipe_foods.find_by(food_id: food.id).quantity
            @total_items += 1
            @total_price += food.price
          end
        end
      end
  
      # Check if the group has less than 3 members
      if current_user.group.users.count < 3
        render 'shopping_list'
      else
        flash[:notice] = "This view is only available for groups with less than 3 members."
        redirect_to shopping_lists_path
      end
    end
  end