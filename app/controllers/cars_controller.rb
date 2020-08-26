class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cars_all = Car.all
    if !params[:search].nil?
      @cars = Car.where(make: params[:search][:query_make]).where(model: params[:search][:query_model])
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
    @transaction = Transaction.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @car.finance_provider = FinanceProvider.find_by(name: params[:car][:finance_provider])
    if @car.save
      flash[:success] = "Your Car Has been listed"
      redirect_to user_path(current_user)
    else
      render new_car_path
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :registration, :price, photos: [])
  end

end
