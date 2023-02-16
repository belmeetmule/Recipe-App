class FoodsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    @foods = Food.all
    render :index
  end

  def new
    @food = Food.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(**food_params)
    if @food.save
      flash[:success] = 'Food saved successfully'
      redirect_to user_foods_url
    else
      flash.now[:error] = 'Error: Food could not be saved'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
    render :edit
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
