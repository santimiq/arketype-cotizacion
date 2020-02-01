class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.text :description
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
