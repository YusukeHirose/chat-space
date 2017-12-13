class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|

      t.text  :body
      t.string  :image
      t.references  :user,  index: { unique: true }, foreign_key: true
      t.timestamps  :grouop,  index: { unique: true }, foreign_key: true
    end
  end
end
