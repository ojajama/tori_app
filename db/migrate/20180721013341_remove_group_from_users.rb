class RemoveGroupFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :group, :string
  end
end
