class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
  :lockable, :timeoutable
  # :confirmable

  has_many :posts, dependent: :delete_all
  has_many :group_users, dependent: :delete_all
  has_many :groups, through: :group_users
end
