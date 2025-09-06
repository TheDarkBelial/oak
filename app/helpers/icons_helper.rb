require "rmagick"

module IconsHelper
  include ActionView::Helpers::AssetUrlHelper

  def icon_tag(icon, **opts)
    path = icon_path(icon.slug, format: icon.format)

    icon.svg? ? inline_svg_tag(path, **opts) : image_tag(path, **opts)
  end

  protected

  def colorize_svg(icon)
    Rails.cache.fetch(icon, expires_in: 12.hours) do
      File.read(icon_asset_path(icon))
          .gsub(/fill:(\s+)?#[0-9A-Fa-f]+/i, "fill:var(--color-primary)")
          .gsub(/stop-color:(\s+)?#[0-9A-Fa-f]+/i, "stop-color:var(--color-primary)")
    end
  end

  def colorize_png(icon)
    Rails.cache.fetch([ icon, icon_color ], expires_in: 12.hours) do
      Magick::Image
        .read(icon_asset_path(icon)).first
        .quantize(256, Magick::GRAYColorspace)
        .colorize(0.9, 0.9, 0.9, icon_color)
        .to_blob
    end
  end

  private

  def icon_asset_path(icon)
    image_path(Rails.root.join(icon.path))
  end

  def icon_color
    Current.theme.color_primary
  end
end
