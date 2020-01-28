class CreateQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :quotations do |t|
      t.string :titulo
      t.string :servicio
      t.date :fecha
      t.text :scope

      t.timestamps
    end
  end
end
