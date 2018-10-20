class Community < ApplicationRecord
  
  has_many :microposts
  has_many :users, through: :microposts
  
end
