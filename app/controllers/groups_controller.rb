class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_group, only: [:show, :edit, :update, :destroy]
    before_action :group_member_user?, only: [:show, :edit, :update, :destroy]

  def show
    @posts = @group.posts
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
      flash.now[:notice] = 'グループ作成ができました。'
      redirect_to @group
    else
      flash.now[:alert] = 'グループ作成ができませんでした。'
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'グループの更新ができました。'
    else
      flash.now[:alert] = 'グループの更新ができませんでした。'
      render :edit
    end
  end

  def destroy
    if @group.destroy
      flash.now[:notice] = 'グループの削除ができました。'
      redirect_to root_path
    else
      flash.now[:alert] = 'グループの削除ができませんでした。'
      redirect_to root_path
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
