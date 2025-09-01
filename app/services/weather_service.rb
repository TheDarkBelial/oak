class WeatherService
  VARIABLES = %i[
    temperature_2m
  ].freeze

  def initialize
    @location = OpenMeteo::Entities::Location.new(
      latitude: Setting[:latitude].to_d,
      longitude: Setting[:longitude].to_d,
      temperature_unit: Setting[:temperature_unit]
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
    Rails.cache.fetch(@location.to_query_params, expires_in: 5.minutes) do
      OpenMeteo::Forecast.new.get(
        location: @location,
        variables: { current: VARIABLES }
      ).current.item
    end
  end
end
