class Product < ApplicationRecord
  belongs_to :talent, foreign_key: :user_id
  has_many_attached :images do |attachable|
    attachable.variant :preview, resize_to_limit: [450, 450]
    attachable.variant :thumb, resize_to_limit: [300, 300]
    attachable.variant :sm_thumb, resize_to_limit: [80, 80]
  end

  has_one_attached :video do |attachable|
    attachable.variant :thumb, resize_to_limit: [300, 300]
  end
  
  has_one_attached :package 
  before_validation :ensure_slug
  validates :slug, presence: true
  enum :product_type, { digital: 0, physical: 1 }
  
  acts_as_commontable dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name", "slug"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["talent"]
  end

  private

  def ensure_slug
    self.slug = name.parameterize
  end
end
