class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :user, foreign_key: true
      t.references :dialgue, foreign_key: true

      t.timestamps
    end
  end
end
