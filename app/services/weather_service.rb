require "open_meteo"

class WeatherService
  attr_reader :location

  def initialize
    @location = OpenMeteo::Entities::Location.new(
      latitude: Setting[:latitude].to_d,
      longitude: Setting[:longitude].to_d
    )
  end

  def self.current
    self.new.fetch_current
  end

  def self.temperature_unit
    case Setting[:temperature_unit]
    when "fahrenheit"
      "°F"
    else
      "°C"
    end
  end

  def fetch_current
    Rails.cache.fetch([ @location.to_query_params, Setting[:temperature_unit] ], expires_in: 5.minutes) do
      OpenMeteo::Forecast.new.get(
        location: @location,
        variables: {
          current: %i[temperature_2m],
          temperature_unit: Setting[:temperature_unit]
        }
      ).current.item
    end
  end
end
