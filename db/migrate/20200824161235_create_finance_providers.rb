class CreateFinanceProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :finance_providers do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
