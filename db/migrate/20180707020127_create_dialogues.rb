class CreateDialogues < ActiveRecord::Migration[5.1]
  def change
    create_table :dialogues do |t|
      t.text :content

      t.timestamps
    end
  end
end
