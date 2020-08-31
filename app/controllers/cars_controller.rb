class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars_all = Car.all
    @cars = Car.all
    if !params[:search].nil?
      params[:search].each do |key, value|
        @cars = @cars.where(key => value) if value.present?
      end
    end
  end

  def show
    @car = Car.find(params[:id])
    @transaction = Transaction.new
    # @markers = @cars.geocoded.map do |car|
    #   {
    #     lat: car.latitude,
    #     lng: car.longitude
    #   }
    # end

    if @transaction
      flash[:success] = "Your Bid Has Gone Through"
    else
      render car_path(params[:car])
    end
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
    # @car.finance_provider = FinanceProvider.find_by(name: params[:car][:finance_provider])
    if @car.save
      flash[:success] = "Your Car Has been listed"
      redirect_to user_path(current_user)
    else
      render new_car_path
    end
  end

        def edit
          @car = current_user.car(params[:id])
        end

        def update
        end

        def destroy
        end

  private

  def car_params
    params.require(:car).permit(:make, :model, :registration, :year, :price, :finance, :reference, :address, :description, :fuel_type, :transmission, :engine_size, :colour, photos: [])
  end
end
