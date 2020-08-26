class UsersController < ApplicationController
  def index

  end

  def show
    @car = Car.new
    @cars = current_user.cars
  end
end
