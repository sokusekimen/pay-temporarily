class GroupsController < ApplicationController
    before_action :find_group, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :group_member_user?, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @group = Group.new
    @group.users << current_user
    @group.owner = current_user.id
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'グループ作成ができました'
    else
      render :new, alert: 'グループ作成ができませんでした'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'グループの更新できました'
    else
      render :edit, alert: 'グループの更新できませんでした'
    end
  end

  def destroy
    if @group.destroy(group_params)
      redirect_to root_path, notice: 'グループの削除できました'
    else
      redirect_to root_path, alert: 'グループの削除できませんでした'
    end
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end

  def group_member_user?
    member = @group.users.find_by(id: current_user.id)
    if member.nil?
      redirect_to root_path, alert: 'メンバーではないグループです'
    end
  end

  def group_params
    params.require(:group).permit(:name, :description, :owner, { :user_ids => [] })
  end
end
