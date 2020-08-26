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
end
