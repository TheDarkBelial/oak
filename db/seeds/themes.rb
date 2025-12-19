Dir.glob(Rails.root.join("db/seeds/themes/*.json")).each do |path|
  name = File.basename(path, ".json").titleize
  styles = JSON.load_file(path)

  styles.transform_keys! do |k|
    k.delete_prefix("--").underscore
  end

  styles.transform_values! do |v|
    v.delete_suffix("px").delete_suffix("rem")
  end

  Theme.find_or_initialize_by(name:, custom: false).update!(styles)
end
