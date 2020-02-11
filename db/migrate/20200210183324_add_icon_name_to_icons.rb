class AddIconNameToIcons < ActiveRecord::Migration[6.0]
  def change
    add_column :icons, :icon_name, :string
  end
end
