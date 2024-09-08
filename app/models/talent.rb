class Talent < User
  default_scope { where(user_type: :talent) }

  has_many :products, foreign_key: :user_id
  has_many :recommendations, as: :commendable

  validates :handle, uniqueness: true

  has_one_attached :cover_photo do |attachable|
    attachable.variant :ultra, resize_to_limit: [1280, 320]
    attachable.variant :desktop, resize_to_limit: [851, 212]
    attachable.variant :mobile, resize_to_limit: [640, 160]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["email", "handle", "first_name", "last_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
