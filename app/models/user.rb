class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :user_type, { talent: 1, client: 2 }

  acts_as_commontator

  def self.ransackable_attributes(auth_object = nil)
    ["email"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
