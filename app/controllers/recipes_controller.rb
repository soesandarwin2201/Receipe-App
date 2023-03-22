class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @recipes = Recipe.all
  end

  def new
    @user = current_user
    @recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end

  def create
    @recipe = Recipe.create!(params.require(:recipe)
      .permit(:name, :preparation_time, :cooking_time, :description)
      .merge(user_id: current_user.id))
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Post saved successfully'
          redirect_to recipes_path
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { recipe: @recipe }
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
    redirect_to recipes_path, alert: 'Recipe not found.' if !@recipe.public && current_user != @recipe.user
    @food = Food.all
  end
end
