class Hashtag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :products, through: :taggings
end
