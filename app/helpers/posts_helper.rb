module PostsHelper
  def sum_total_price id
    group = Group.find_by(id: id)
    price = group.posts.pluck(:total_price)
    return price.sum
  end

  def equally id
    group = Group.find_by(id: id)
    group_user_count = group.users.count
    group_total_price = sum_total_price(id)
    return group_total_price / group_user_count
  end
end
