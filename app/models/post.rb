class Post < ApplicationRecord

  
  has_many :comments
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  has_many :images
  has_many :users, through: :images

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :content, presence: true
  validates :user_id, presence: true

end
