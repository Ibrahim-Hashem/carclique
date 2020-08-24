class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :reference
      t.integer :price
      t.string :model
      t.text :description
      t.string :registration
      t.integer :engine_size
      t.string :fuel_type
      t.integer :year
      t.string :transmission
      t.string :hpi_clear
      t.string :make
      t.references :user, null: false, foreign_key: true
      # t.references :finance_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
