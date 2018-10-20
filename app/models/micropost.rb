class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :content, presence: true, length: { maximum: 255 }
end
