class AddUserRefToYoureis < ActiveRecord::Migration[5.1]
  def change
    add_reference :youreis, :user, foreign_key: true
  end
end
