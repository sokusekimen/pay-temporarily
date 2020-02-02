class PagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_groups_user_in, only: :index

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def find_groups_user_in
    @groups = current_user.groups
  end

end
