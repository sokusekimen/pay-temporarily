class User < ApplicationRecord
  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
  # :confirmable

  has_many :posts, dependent: :delete_all
  has_many :group_users, dependent: :delete_all
  has_many :groups, through: :group_users

  has_many :active_requests, class_name: "FriendRequest", foreign_key: :from_user_id
  has_many :requestings, through: :active_requests, source: :to_user
  has_many :passive_requests, class_name: "FriendRequest", foreign_key: :to_user_id
  has_many :requests, through: :passive_requests, source: :from_user
end
