class Profile < ApplicationRecord
  belongs_to :user

  validates :gender, :text, :image, presence: true
end
