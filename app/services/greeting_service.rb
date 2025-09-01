class GreetingService
  def self.current
    case Time.current.hour
    when 5..11
      Setting["morning_greeting"]
    when 12..16
      Setting["afternoon_greeting"]
    when 17..20
      Setting["evening_greeting"]
    else
      Setting["night_greeting"]
    end
  end
end
