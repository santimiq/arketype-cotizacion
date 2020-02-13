class CreateConceptQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_quotations do |t|
      t.string :concepto
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
