class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :likes

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :email, presence: true, uniqueness: true

  def like? post_id
    likes.find_by_post_id(post_id)
  end
end
