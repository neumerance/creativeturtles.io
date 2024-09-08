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
  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings
  after_save :extract_hashtags

  validates :slug, presence: true
  enum :product_type, { digital: 0, physical: 1 }

  def hashtag_list
    hashtags.map(&:name).join(', ')
  end

  def hashtag_list=(tags_string)
    self.hashtags = tags_string.split(',').map do |name|
      Hashtag.find_or_create_by(name: name.strip.downcase)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "slug"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["talent"]
  end

  private

  def extract_hashtags
    hashtags = description.scan(/#\w+/).map { |tag| tag.downcase.delete('#') }
    self.hashtags = hashtags.map { |name| Hashtag.find_or_create_by(name: name) }
  end

  def ensure_slug
    self.slug = name.parameterize
  end
end
