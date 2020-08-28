class UsersController < ApplicationController
  def index
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(strong_params)
    if @car.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    # @car = Car.new
    @bidded_cars = Car.joins(:transactions).where(transactions: { user: current_user }).distinct
    @my_cars = Car.where(user: current_user)
  end

  def edit
    @car = Car.find(params[:car])
  end

  def update
    @car = Car.find(params[:car])
    @car.update(strong_params)
  end

  private
    def strong_params
      params.require(:car).permit(:reference, :price, :registration, :description, :finance_provider, :photos [])
    end
  end
