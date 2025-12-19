class Bookmark < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list scope: :category

  broadcasts_refreshes

  belongs_to :category

  validates :token, :name, :url, presence: true
end
