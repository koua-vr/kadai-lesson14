class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :detail, presence: true, length: { maximum: 255 }
  
  has_many :ownerships
  has_many :users, through: :ownerships
  
  has_many :wants
  has_many :want_users, through: :wants, class_name: 'User', source: :user
end
