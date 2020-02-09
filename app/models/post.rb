class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def sum_total_price
    
  end
end
