class Post < ApplicationRecord
  validates :title, presence: true
  validates :total_price, presence: true

  belongs_to :user
  belongs_to :group
end
