class Image < ApplicationRecord

  belogs_to :user
  belogs_to :post

  validates :photo, presence: true
  validates :content_id, presence: true
  validates :user_id presence: true
end
