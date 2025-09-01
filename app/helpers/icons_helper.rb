module IconsHelper
  def icon_tag(icon, **opts)
    if icon.svg?
      inline_svg_tag(icon.path, **opts)
    else
      image_tag(image_path(icon.path), **opts)
    end
  end
end
