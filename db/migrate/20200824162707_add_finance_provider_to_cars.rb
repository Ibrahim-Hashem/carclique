class AddFinanceProviderToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :finance_provider
  end
end
