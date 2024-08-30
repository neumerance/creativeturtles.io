class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :user_type, { talent: 1, client: 2 }
  before_validation :define_handle

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [220, 220]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["email"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def define_handle
    return unless self.handle.present?

    self.handle = self.handle.parameterize.gsub("_", ".")
  end
end
