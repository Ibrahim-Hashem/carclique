class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :amount, numericality: { greater_than_or_equal_to: 0, greater_than: Transaction.where(car: self.car).last.amount }
  #the above where statement is referring to the car which is specific to that current bid/transaction.
end
