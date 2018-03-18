class Post < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_title, :against => :title, :using => {:tsearch => {:prefix => true}}

  default_scope { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true
end
