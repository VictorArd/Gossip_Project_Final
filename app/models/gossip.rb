class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :comments
  has_many :likes

  validates :title,
    presence: true,
    length: { maximum: 30 }

  validates :content,
    presence: true
end
