class Group < ApplicationRecord
  has_many :posts, dependent: :delete_all
  has_many :group_users, dependent: :delete_all
  has_many :users, through: :group_users
end
