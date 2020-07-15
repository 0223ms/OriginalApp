class Room < ApplicationRecord

  belongs_to :user
  has_many :messages
  has_many :users, through: :messages

  validates :name presence: true
  validates :user_id, presence: true
end
