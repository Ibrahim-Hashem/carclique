class TransactionsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @transaction = Transaction.new(transactions_params)
    @transaction.car = @car
    @transaction.user = current_user
    @transaction.status = "Pending"
    @min = @car.transactions.present? ? @car.transactions.last.amount : @car.price
     
    if @transaction.user == @car.user
      redirect_to car_path(@car), notice: "You can't bid on your own car"
    elsif @transaction.amount < @min
      render 'cars/show', notice: "Your bid must be greater than the previous one"
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
