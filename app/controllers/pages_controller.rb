class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :find_groups_user_in, only: :index
  before_action :is_logged_in_user, only: :show

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def requestings
    user = User.find(params[:id])
    @users = user.requestings
  end

  def requests
    user = User.find(params[:id])
    @users = user.requests
  end

  private
  def find_groups_user_in
    @groups = current_user.groups
  end

  def is_logged_in_user
    user = User.find_by(id: params[:id])
    if user === current_user
      redirect_to root_path
    end
  end

end
