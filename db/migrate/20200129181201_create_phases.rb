class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    create_table :phases do |t|
      t.string :title
      t.text :description
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
