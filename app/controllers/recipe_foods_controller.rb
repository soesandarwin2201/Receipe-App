class RecipeFoodsController < ApplicationController
  
    def new
      @food = Food.new
      respond_to do |format|
        format.html { render :new, locals: { food: @food } }
      end
    end
  
    def create
      @food = Food.new(food_params.merge(user_id: current_user.id))
      respond_to do |format|
        format.html do
          if @food.save!
            flash[:success] = 'food saved successfully'
            redirect_to foods_url
          else
            flash.now[:error] = 'Error: Food could not be saved'
            render :new, locals: { food: @food }
          end
        end
      end
    end
  
    def destroy
      @food = Food.find(params[:id])
      if @food.destroy
        flash[:success] = 'food deleted successfully'
        redirect_to foods_path
      else
        flash.now[:error] = 'Error: Food could not be delete'
      end
    end
  
    private
  
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
  end
  