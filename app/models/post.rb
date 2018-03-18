class Post < ApplicationRecord
  # full-text-search
  include PgSearch
  pg_search_scope :search_by_title, :against => :title, :using => { :tsearch => { :prefix => true } }

  # Scope
  default_scope { order(created_at: :desc) }

  # Image
  mount_uploader :image, ImageUploader

  # Association
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validation
  validates :image, presence: true
end
