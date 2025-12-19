class CreateThemes < ActiveRecord::Migration[8.0]
  def change
    create_table :themes do |t|
      t.string :token, null: false
      t.string :name, null: false
      t.boolean :custom, null: false, default: 1
      t.boolean :enabled, null: false, default: 1
      t.integer :color_scheme, null: false, default: 0
      t.string :color_base_100, null: false, default: "oklch(20.84% 0.008 17.911)"
      t.string :color_base_200, null: false, default: "oklch(18.522% 0.007 17.911)"
      t.string :color_base_300, null: false, default: "oklch(16.203% 0.007 17.911)"
      t.string :color_base_content, null: false, default: "oklch(83.768% 0.001 17.911)"
      t.string :color_primary, null: false, default: "oklch(68.628% 0.185 148.958)"
      t.string :color_primary_content, null: false, default: "oklch(0% 0 0)"
      t.string :color_secondary, null: false, default: "oklch(69.776% 0.135 168.327)"
      t.string :color_secondary_content, null: false, default: "oklch(13.955% 0.027 168.327)"
      t.string :color_accent, null: false, default: "oklch(70.628% 0.119 185.713)"
      t.string :color_accent_content, null: false, default: "oklch(14.125% 0.023 185.713)"
      t.string :color_neutral, null: false, default: "oklch(30.698% 0.039 171.364)"
      t.string :color_neutral_content, null: false, default: "oklch(86.139% 0.007 171.364)"
      t.string :color_info, null: false, default: "oklch(72.06% 0.191 231.6)"
      t.string :color_info_content, null: false, default: "oklch(0% 0 0)"
      t.string :color_success, null: false, default: "oklch(64.8% 0.15 160)"
      t.string :color_success_content, null: false, default: "oklch(0% 0 0)"
      t.string :color_warning, null: false, default: "oklch(84.71% 0.199 83.87)"
      t.string :color_warning_content, null: false, default: "oklch(0% 0 0)"
      t.string :color_error, null: false, default: "oklch(71.76% 0.221 22.18)"
      t.string :color_error_content, null: false, default: "oklch(0% 0 0)"
      t.float :radius_selector, null: false, default: 1
      t.float :radius_field, null: false, default: 2
      t.float :radius_box, null: false, default: 1
      t.float :size_selector, null: false, default: 0.25
      t.float :size_field, null: false, default: 0.25
      t.float :border, null: false, default: 1
      t.boolean :depth, null: false, default: 0
      t.boolean :noise, null: false, default: 0
      t.timestamps
    end

    add_index :themes, :token, unique: true
  end
end
