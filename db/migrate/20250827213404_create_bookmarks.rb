class CreateBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmarks do |t|
      t.references :category, null: false, foreign_key: true
      t.string :token, null: false
      t.string :name, null: false
      t.string :url, null: false
      t.integer :position

      t.timestamps
    end

    add_index :bookmarks, :token, unique: true
    add_index :bookmarks, :position
  end
end
