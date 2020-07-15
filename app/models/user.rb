class User < ApplicationRecord

  has_many :follows
  has_many :messages
  has_many :images
  has_many :comments
  has_many :rooms
  has_many :posts
  has_many :likes, dependent: :destroy


  validates :username, presence: true, unique: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :phonenumber, presence: true
  validates :password, presence: true
end
