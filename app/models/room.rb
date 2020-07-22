class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :name,    presence: true
  validates :user_id, presence: true
end
