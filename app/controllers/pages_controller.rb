class PagesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :find_groups_user_in, only: :show

  def show
  end

  private
  def find_groups_user_in
    @groups = current_user.groups
  end

end
