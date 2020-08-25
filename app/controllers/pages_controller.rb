class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
     @cars = Car.search_by_make_and_model(params[:query])
    else
      @cars = Car.all
    end
  end

end
