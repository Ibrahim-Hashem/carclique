class AddFinanceToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :finance, :string
  end
end
