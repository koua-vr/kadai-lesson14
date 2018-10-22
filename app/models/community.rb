class Community < ApplicationRecord
  has_many :microposts
  has_many :users, through: :microposts
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :detail, presence: true, length: { maximum: 255 }
end