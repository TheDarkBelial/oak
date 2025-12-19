class Icon < ApplicationRecord
  include Identifiable

  identifies_by :slug
  broadcasts_refreshes

  has_many :icon_variants, dependent: :destroy

  validates :slug, :name, presence: true
end
