class Post < ApplicationRecord

  
  has_many :comments
  has_many :users, through: :comments
  has_many :likes
  has_many :users, through: :likes
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  has_many :images
  has_many :usershas_many :users, through: :images


  validates :content, presence: true
  validates :user_id, presence: true

end
