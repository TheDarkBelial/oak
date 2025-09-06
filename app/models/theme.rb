class Theme < ApplicationRecord
  broadcasts_refreshes

  validates :slug, :name, :color_primary, presence: true

  def self.default
    find_by(slug: "forest")
  end
end
