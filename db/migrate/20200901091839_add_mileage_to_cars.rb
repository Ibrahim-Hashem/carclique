class AddMileageToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :mileage, :string
  end
end
