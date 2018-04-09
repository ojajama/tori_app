class AddLockVersionToWord < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :lock_version, :integer, default: 0, null: false
  end
end
