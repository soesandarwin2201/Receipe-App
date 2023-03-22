class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
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
    redirect_to recipe_path(params[:recipe_id])
  end
end
