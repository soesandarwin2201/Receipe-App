class FoodRecipesController < ApplicationController
  def index 
    @food_recipes = RecipeFood.all
  end

  def new 
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = RecipeFood.new
    respond_to do |format| 
      format.html { render :new, locals: { recipe: @recipe, food_recipe: @food_recipe } }
    end
  end

  def edit 
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = RecipeFood.find(params[:id])
  end

  def create
  @recipe = Recipe.find(params[:recipe_id])
  @food_recipe = RecipeFood.new(strong_params)
  @food_recipe.recipe = @recipe
  respond_to do |format|
    if @food_recipe.save!
      format.html do
        flash[:success] = 'Food recipe saved successfully'
        redirect_to recipe_path(params[:recipe_id])
      end
    else 
      format.html do
        flash.now[:error] = 'Error: Food recipe could not be saved'
        render :new, locals: { recipe: @recipe, food_recipe: @food_recipe }
      end
    end
  end
end

  private 

def strong_params
  params.require(:food_recipe).permit(:quantity, :food_id)
end
end

