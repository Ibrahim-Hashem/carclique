class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @cars = Car.search_by_make_and_model(params[:query])
    else
      @cars = Car.all
    end
    #@deals = Car.all.sample(6)
    @deals = Car.order(:price).first(3)

    @reviews = [{ name: "Ben", content: "very good service, would definitely recommend" }, { name: "Mo", content: "A very, quick and easy way to get rid of debt and make profit"}]
  end

  def carousel
  end
end
