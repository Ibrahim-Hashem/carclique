class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :car
  # validates :amount, numericality: { greater_than_or_equal_to: 0, greater_than: Transaction.where(car: Self.car).last.amount }
  validate :minimum_amount

  private

  def minimum_amount
    if (Transaction.where(car: car).order(:created_at).last&.amount || 0) >= amount
      errors.add(:amount, "must be greater than the previous bid")
    end
  end
  #the above where statement is referring to the car which is specific to that current bid/transaction.
end
