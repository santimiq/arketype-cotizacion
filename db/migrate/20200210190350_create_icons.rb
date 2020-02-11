class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons do |t|
      t.string :icon_name
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
