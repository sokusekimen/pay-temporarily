class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_friendship, only: :create
  before_action :destroy_friendship, only: :destroy

  def show
    user = User.find(params[:page_id])
    @user_friends = user.friends
  end

  def create
    if @from_friendship.save && @to_friendship.save && @request.destroy
      flash.now[:notice] = '友達になりました。'
      redirect_to page_friendships_path(current_user.id)
    else
      flash.now[:alert] = '失敗しました。'
      redirect_to 'page#requests'
    end
  end

  def destroy
    if @from_friendship.destroy && @to_friendship.destroy
      flash.now[:notice] = '友達から削除しました。'
      redirect_to page_friendships_path(current_user.id), notice: '友達から削除しました。'
    else
      flash.now[:alert] = '失敗しました。'
      redirect_to 'page#requests'
    end
  end

  private
  def create_friendship
    @to_friend = User.find_by(id: params[:page_id])
    @from_friendship = current_user.friendships.build(friend_id: @to_friend.id)
    @to_friendship = @to_friend.friendships.build(friend_id: current_user.id)
    @request = @to_friend.active_requests.find_by(to_user: current_user.id)
  end

  def destroy_friendship
    @to_friend = User.find_by(id: params[:page_id])
    @from_friendship = current_user.friendships.find_by(friend_id: @to_friend.id)
    @to_friendship = @to_friend.friendships.find_by(friend_id: current_user.id)
  end
end
