class Recommendation < ApplicationRecord
  belongs_to :commendable, polymorphic: true
  belongs_to :user, foreign_key: :user_id
end
