class Icon < ApplicationRecord
  broadcasts_refreshes

  has_many :applications, dependent: :destroy

  validates :slug, :name, presence: true

  enum :format, {
    svg: 0,
    png: 1,
    webp: 2
  }, validate: true

  enum :theme, {
    default: 0,
    light: 1,
    dark: 2
  }, validate: true, suffix: true

  def filename
    @filename ||= default_theme? ? "#{slug}.#{format}" : "#{slug}-#{theme}.#{format}"
  end

  def path
    @path ||= "icons/#{format}/#{filename}"
  end
end
