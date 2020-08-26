class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cars = Car.where(make: params[:search][:query_make])
  end

  def show
    @car = Car.find(params[:id])
    @transaction = Transaction.new
  end

  

end
