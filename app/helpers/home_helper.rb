module HomeHelper
  def date_tag(**opts)
    return unless Setting[:date_enabled]

    content_tag(:span, **opts) do
      Time.current.strftime(Setting[:date_format])
    end
  end

  def time_tag(**opts)
    return unless Setting[:time_enabled]

    content_tag(:span, **opts) do
      Time.current.strftime(Setting[:time_format])
    end
  end

  def temperature_tag(**opts)
    return unless Setting[:weather_enabled]

    content_tag(:span, **opts) do
      "#{WeatherService.current.temperature_2m}#{WeatherService.temperature_unit}"
    end
  end
end
