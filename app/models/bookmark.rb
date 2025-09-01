class Bookmark < ApplicationRecord
  has_secure_token :token

  acts_as_list scope: :category

  broadcasts_refreshes

  belongs_to :category

  validates :token, :name, :url, presence: true

  def to_param = token
end
