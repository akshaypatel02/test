class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :author
      t.text :body
      t.integer :feed_id
      t.integer :entry_id

      t.timestamps null: false
    end
  end
end
