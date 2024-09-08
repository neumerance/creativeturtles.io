class UserPreference < ApplicationRecord
  belongs_to :talent, foreign_key: :user_id
end
