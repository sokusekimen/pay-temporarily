class Group < ApplicationRecord
  validates :name, presence: true
  validates :owner, presence: true
  
  has_many :posts, dependent: :delete_all
  has_many :group_users, dependent: :delete_all
  has_many :users, through: :group_users
end
