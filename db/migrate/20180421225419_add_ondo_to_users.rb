class AddOndoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ondo, :string
  end
end
