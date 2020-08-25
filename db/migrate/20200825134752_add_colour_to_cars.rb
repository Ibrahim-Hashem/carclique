class AddColourToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :colour, :string
  end
end
