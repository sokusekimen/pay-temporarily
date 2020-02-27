class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_not_friend, only: :create

  def create
    request = current_user.active_requests.build(to_user_id: params[:page_id])
    request.save
    redirect_to requestings_page_path(current_user.id), notice: 'フレンド申請しました。'
  end

  def destroy
    request = current_user.active_requests.find_by(to_user_id: params[:page_id])
    request.destroy
    redirect_to requestings_page_path(current_user.id), notice: '申請を削除しました。'
  end

  private
  def is_not_friend
    friend = Friendship.find_by(friend_id: params[:page_id])
    unless friend.nil?
      redirect_to root_path, notice: 'すでに友達です。'
    end
  end
end