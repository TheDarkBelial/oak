require "ostruct"

icons = JSON.load_file!(Rails.root.join("config/icons.json"), object_class: OpenStruct).flat_map do |icon|
  icon_set = []

  %w[SVG PNG WebP].each do |format|
    if icon.respond_to?(format) && icon.try(format) == "Yes"
      icon_set << {
        slug: icon.Reference,
        name: icon.Name,
        tags: icon.Tags,
        format: format.downcase,
        theme: :default
      }

      %w[Light Dark].each do |theme|
        if icon.respond_to?(theme) && icon.try(theme) == "Yes"
          icon_set << {
            slug: icon.Reference,
            name: icon.Name,
            tags: icon.Tags,
            format: format.downcase,
            theme: theme.downcase
          }
        else
          Icon.where(
            slug: icon.Reference,
            format: format.downcase,
            theme: theme.downcase
          ).destroy_all
        end
      end
    else
      Icon.where(
        slug: icon.Reference,
        format: format.downcase
      ).destroy_all
    end
  end

  icon_set
end

Icon.upsert_all(icons, unique_by: %i[slug format theme])
