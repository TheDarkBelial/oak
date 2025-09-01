class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.string :value
      t.string :default
      t.integer :value_type, null: false
      t.integer :position

      t.timestamps
    end

    add_index :settings, :slug, unique: true
    add_index :settings, :name, unique: true
  end
end
