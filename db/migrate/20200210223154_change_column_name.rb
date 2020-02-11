class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :requirements, :name, :nombre
  end
end
