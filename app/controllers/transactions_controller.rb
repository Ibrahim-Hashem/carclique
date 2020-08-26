class TransactionsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @transaction = Transaction.new(transactions_params)
    @transaction.car = @car
    @transaction.user = current_user
    if @transaction.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def transactions_params
    params.require(:transaction).permit(:amount)
  end

  def update
  end
end