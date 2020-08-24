class Car < ApplicationRecord
  belongs_to :user
  belongs_to :finance_provider
end
