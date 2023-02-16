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
        @food = Food.new(food_params)
        if @food.save?
            redirect_to :foods_path
        else
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
        params.require(:food).permit(:name, :measurement_unit, :price)
    end

end
