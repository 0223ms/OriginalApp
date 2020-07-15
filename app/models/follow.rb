class Follow < ApplicationRecord

  belongs_to :user


  validates :follow_id, presence: true
  validates :follower_id, presence: true
  
end
