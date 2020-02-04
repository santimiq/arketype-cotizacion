class CreateTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.integer :subtotal
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
