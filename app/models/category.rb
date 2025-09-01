class Category < ApplicationRecord
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  has_many :bookmarks, dependent: :destroy

  validates :token, :name, presence: true

  def to_param = token
end
