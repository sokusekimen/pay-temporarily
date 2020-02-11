module PostsHelper
  def sum_total_price(id)
    group = Group.find_by(id: id)
    price = group.posts.pluck(:total_price)
    return price.sum
  end

  def equally
  end
end
