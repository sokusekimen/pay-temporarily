class FriendRequestsController < ApplicationController

  def create
    request = current_user.active_requests.build(to_user_id: params[:page_id])
    request.save
    redirect_to root_path
  end

  def destroy
    request = current_user.active_requests.find_by(to_user_id: params[:page_id])
    request.destroy
    redirect_to root_path
  end

end