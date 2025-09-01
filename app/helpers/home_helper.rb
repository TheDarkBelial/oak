require "open_meteo"

module HomeHelper
  def datetime
    data = [ date_tag, date_time_separator, live_time_tag ].compact
    return if data.blank?

    safe_join data
  end

  def temperature
    return unless Setting[:weather_enabled]

    data = WeatherService.current

    "#{data.temperature_2m}#{WeatherService.temperature_unit}"
  end

  private

  def date_tag
    return unless Setting[:date_enabled]

    content_tag(:span) { Time.current.strftime(Setting[:date_format]) }
  end

  def date_time_separator
    " &ndash; ".html_safe if Setting[:date_enabled] && Setting[:time_enabled]
  end

  def live_time_tag
    return unless Setting[:time_enabled]

    content_tag(:span) do
      Time.current.strftime(Setting[:time_format])
    end
  end
end
