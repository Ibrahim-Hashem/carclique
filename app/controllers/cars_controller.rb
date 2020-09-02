class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars_all = Car.all
    @cars = Car.all
    if !params[:query].nil?
      @cars = Car.where('make ILIKE ?', params[:query])
    end
    if !params[:search].nil?
      params[:search].each do |key, value|
        @cars = @cars.where(key => value) if value.present?
      end
    end
  end

  def show
    @car = Car.find(params[:id])
    @transaction = Transaction.new
    @similar_cars = Car.where(make: @car.make).first(6)
    @markers =
      {
        lat: @car.latitude,
        lng: @car.longitude,
        image_url: helpers.asset_url('mapmarker.png')
      }

    if @transaction
      flash[:success] = "Your Bid Has Gone Through"
    else
      render car_path(params[:car])
    end
  end

  def accept_bid
    @car = Car.find(params[:id])
    last_bid = @car.transactions.last
    last_bid.update_attribute("status", "Accepted")
    redirect_to car_path(@car)
  end

  def new
    @car = Car.new
    @user = current_user
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @markers = [ {lat: @car.user.latitude,
        lng: @car.user.longitude, image_url: helpers.asset_url('mapmarker.png')}]
    @car.finance_provider = FinanceProvider.find_by(name: params[:car][:finance_provider])

    if @car.save
      flash[:success] = "Your Car Has been listed"
      redirect_to user_path(current_user)
    else
      render new_car_path
    end
  end

  def edit
    @car = Car.find(params[:id])

  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to user_path(current_user)
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :registration, :year, :mileage, :price, :reference, :address, :description, :fuel_type, :transmission, :engine_size, :colour, :hpi_clear, photos: [])
  end
end
