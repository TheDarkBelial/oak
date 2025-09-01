class WisdomService
  ##
  # TODO: MOVE THESE INTO THE DB.
  #
  WISDOM_QUOTES = YAML.load_file(Rails.root.join("config/wisdom.yml"))

  attr_reader :quote, :author

  def initialize(quote:, author:)
    @quote = quote
    @author = author
  end

  def self.current
    self.new(**fetch_wisdom)
  end

  def self.fetch_wisdom
    Rails.cache.fetch("wisdom", expires_at: Time.current.end_of_day) do
      WISDOM_QUOTES.sample.symbolize_keys
    end
  end
  private_class_method :fetch_wisdom
end
