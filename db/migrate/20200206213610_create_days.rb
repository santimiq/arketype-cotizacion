class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :fecha
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
