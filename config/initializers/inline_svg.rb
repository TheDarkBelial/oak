require_relative "../../app/helpers/icons_helper"

class IconAssetFileLoader < InlineSvg::AssetFile
  extend IconsHelper

  def self.named(filename)
    return colorize_svg(icon_from_path(filename)) if filename.start_with?("/icons/")

    super
  end

  def self.icon_from_path(path)
    Icon.find_by!(
      slug: path.delete_prefix("/icons/").delete_suffix(".svg"),
      format: :svg,
      theme: :light
    )
  end
end

InlineSvg.configure do |config|
  config.svg_not_found_css_class = "!w-8 !h-4 py-2 fa-solid fa-question border border-dashed text-primary border-primary rounded-box"
  config.asset_file = IconAssetFileLoader
end
