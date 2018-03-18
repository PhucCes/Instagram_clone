class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Association
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validation
  validates_presence_of :user_name, :email, :password
  validates :user_name, length: { minimum: 4, maximum: 16 }
  validates :password, length: { minimum:8 }
  validates :email, uniqueness: true

  before_save :downcase_email

  def like? post_id
    likes.find_by_post_id(post_id)
  end

  private
    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end
end
