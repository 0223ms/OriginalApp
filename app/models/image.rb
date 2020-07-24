class Image < ApplicationRecord
  belogs_to :post

  validates :photo,   presence: true
  validates :post_id, presence: true
end
