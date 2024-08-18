class Talent < User
  default_scope { where(user_type: :talent) }

  def self.ransackable_attributes(auth_object = nil)
    ["email", "handle", "first_name", "last_name", "country"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
