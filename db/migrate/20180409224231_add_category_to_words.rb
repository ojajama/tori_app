class AddCategoryToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :category, :string
  end
end
