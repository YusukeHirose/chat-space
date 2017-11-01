class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, index: { unique: true }, foreign_key: true
    add_column :users, :group_id, :integer, default: 1, null: false, foreign_key: true
    add_index :users, :group_id
  end
end
