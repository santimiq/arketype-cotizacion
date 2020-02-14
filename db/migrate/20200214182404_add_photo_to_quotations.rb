class AddPhotoToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_column :quotations, :photo, :string
  end
end
