class CreateIcons < ActiveRecord::Migration[8.0]
  def change
    create_table :icons do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.string :tags
      t.integer :format, null: false
      t.integer :theme, null: false

      t.timestamps
    end

    add_index :icons, %i[slug format theme], unique: true
  end
end
