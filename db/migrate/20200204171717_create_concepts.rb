class CreateConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :cantidad
      t.string :subtotal
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
