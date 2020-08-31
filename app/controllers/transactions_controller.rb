class TransactionsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @transaction = Transaction.new(transactions_params)
    @transaction.car = @car
    @transaction.user = current_user
    @transaction.status = "Pending"
    if @transaction.user == @car.user
      redirect_to car_path(@car), notice: "You can't bid on your own car"
    elsif @transaction.save
      redirect_to user_path(current_user)
    else
      render 'cars/show'
    end
  end

  private

  def transactions_params
    params.require(:transaction).permit(:amount)
  end

  def update
  end
end
