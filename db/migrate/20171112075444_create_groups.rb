class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|

      t.string :name, unique: true
      t.references :user,  index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end