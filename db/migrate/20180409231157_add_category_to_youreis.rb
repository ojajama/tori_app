class AddCategoryToYoureis < ActiveRecord::Migration[5.1]
  def change
    add_column :youreis, :category, :string
  end
end
