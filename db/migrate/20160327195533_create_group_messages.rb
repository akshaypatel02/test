class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.references :group, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
