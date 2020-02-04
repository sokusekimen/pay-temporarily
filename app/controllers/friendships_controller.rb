class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:page_id])
    @user_friends = user.friends
  end

  def create
    to_friend = User.find_by(id: params[:page_id])

    from_friendship = current_user.friendships.build(friend_id: to_friend.id)
    to_friendship = to_friend.friendships.build(friend_id: current_user.id)
    request = current_user.active_requests.find_by(to_user_id: to_friend.id)
    
    binding.pry
    if from_friendship.save && to_friendship.save && request.destroy
      redirect_to page_friendships_path(current_user.id)
    else
      redirect_to 'page#requests', notice: '失敗しました。'
    end
  end

  def destroy
  end
end
