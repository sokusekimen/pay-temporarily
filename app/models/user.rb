class User < ApplicationRecord
  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :authentication_keys => [:login]
  # :confirmable

  attr_accessor :login

  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 3, maximum: 25 }
  
  has_many :posts, dependent: :delete_all
  
  has_many :group_users, dependent: :delete_all
  has_many :groups, through: :group_users

  has_many :active_requests, class_name: "FriendRequest", foreign_key: :from_user_id, dependent: :delete_all
  has_many :requestings, through: :active_requests, source: :to_user
  has_many :passive_requests, class_name: "FriendRequest", foreign_key: :to_user_id, dependent: :delete_all
  has_many :requests, through: :passive_requests, source: :from_user

  has_many :friendships, class_name: "Friendship", foreign_key: :user_id, dependent: :delete_all
  has_many :friends, through: :friendships, source: :friend

  def requesting?(user)
    passive_requests.find_by(from_user: user.id).present?
  end

  def is_requested?(user)
    active_requests.find_by(to_user: user.id).present?
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

end
