class Application < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  belongs_to :icon_variant
  has_one :icon, through: :icon_variant

  validates :token, :name, :url, presence: true
end
