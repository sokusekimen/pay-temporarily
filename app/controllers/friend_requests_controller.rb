class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_not_friend, only: :create

  def create
    request = current_user.active_requests.build(to_user_id: params[:page_id])
    request.save
    flash[:notice] = 'フレンド申請しました。'
    redirect_to requestings_page_path(current_user.id)
  end

  def destroy
    request = current_user.active_requests.find_by(to_user_id: params[:page_id])
    request.destroy
    flash[:notice] = '申請を削除しました。'
    redirect_to requestings_page_path(current_user.id)
  end

  private
  def is_not_friend
    friend = Friendship.find_by(friend_id: params[:page_id])
    unless friend.nil?
      flash[:notice] = 'すでに友達です。'
      redirect_to root_path
    end
  end
end