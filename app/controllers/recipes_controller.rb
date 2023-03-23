class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = current_user
    @recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end

  def create
    puts params.inspect
  @recipe = current_user.recipes.new(recipe_params)
  respond_to do |format|
    if @recipe.save!
      flash[:success] = 'Post saved successfully'
      format.html { redirect_to recipes_path }
    else
      flash.now[:error] = 'Error: Post could not be saved'
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end
end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = "you updated the recipe status to private"
    else
      @recipe.update(public: true)
      flash[:notice] = 'you updated the recipe status to public'
    end
    redirect_to recipes_path
  end

  private

def recipe_params
  params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
end
end
