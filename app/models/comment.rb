class Comment < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :post

  # Validation
  validates :content, presence: true , length: { maximum: 300 }
end
