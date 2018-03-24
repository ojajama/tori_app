class AddUserRefToYoureis < ActiveRecord::Migration[5.1]
  def change
    add_column :youreis, :user, :reference
  end
end
