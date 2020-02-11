class AddSuperTitleToRequirement < ActiveRecord::Migration[6.0]
  def change
    add_column :requirements, :super_title, :string
  end
end
