class Application < ApplicationRecord
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  belongs_to :icon

  validates :token, :name, :url, presence: true

  def to_param = token
end
