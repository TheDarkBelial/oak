class Setting < ApplicationRecord
  broadcasts_refreshes

  acts_as_list

  validates :slug, :default, :value_type, presence: true

  enum :value_type, {
    boolean: 0,
    integer: 1,
    float: 2,
    string: 3
  }, validate: true

  def to_param = slug

  def parsed_value
    case value_type.to_sym
    when :boolean
      defaulted_value.to_i.positive?
    when :integer
      defaulted_value.to_i
    when :float
      defaulted_value.to_f
    else
      defaulted_value
    end
  end

  def self.[](slug)
    Setting.find_by(slug:)&.parsed_value
  end

  private

  def defaulted_value
    value.presence || default
  end
end
