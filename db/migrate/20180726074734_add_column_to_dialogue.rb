class AddColumnToDialogue < ActiveRecord::Migration[5.1]
  def change
    add_column :dialogues, :category, :string
  end
end
