class CreateThemes < ActiveRecord::Migration[8.0]
  def change
    create_table :themes do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.string :color_primary # For icon colorization.
      t.timestamps
    end

    add_index :themes, :slug, unique: true
  end
end
