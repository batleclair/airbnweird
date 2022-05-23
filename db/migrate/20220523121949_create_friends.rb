class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.text :description
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :language
      t.integer :price

      t.timestamps
    end
  end
end
