class AddSlugToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_column :quotations, :slug, :string
    add_index :quotations, :slug, unique: true
  end
end
