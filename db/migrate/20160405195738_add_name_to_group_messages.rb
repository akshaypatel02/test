class AddNameToGroupMessages < ActiveRecord::Migration
  def change
    add_column :group_messages, :group_name, :string
  end
end
