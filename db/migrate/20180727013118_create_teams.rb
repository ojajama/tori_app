class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|

      t.text :vocabulary, default: "最初の尻取り"

      t.timestamps
    end
  end
end
