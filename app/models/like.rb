class Like < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :post

  # Validation
  validates :user_id, uniqueness: { scope: :post_id }
end
