class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :token, null: false
      t.string :name, null: false
      t.integer :position

      t.timestamps
    end

    add_index :categories, :token, unique: true
    add_index :categories, :position
  end
end
