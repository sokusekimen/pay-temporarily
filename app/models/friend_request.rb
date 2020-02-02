class FriendRequest < ApplicationRecord
  validates :to_user_id, presence: true
  validates :from_user_id, presence: true

  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
end
