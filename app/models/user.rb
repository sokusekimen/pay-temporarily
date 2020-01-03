class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
  :lockable, :timeoutable
  # :confirmable

  has_many :groups, through: :group_users
  has_many :group_users
end
