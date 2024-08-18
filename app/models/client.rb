class Client < User
  default_scope { where(user_type: :client) }

  def self.ransackable_attributes(auth_object = nil)
    ["email", "first_name", "last_name", "country"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
