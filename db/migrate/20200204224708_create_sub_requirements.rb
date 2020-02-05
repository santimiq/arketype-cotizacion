class CreateSubRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_requirements do |t|
      t.string :requerimiento
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
