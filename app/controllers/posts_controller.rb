class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @group = Group.find(params[:group_id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.group_id = params[:group_id]
    if @post.save
      flash.now[:notice] = '作成ができました'
      redirect_to group_post_path(@post.group_id, @post.id)
    else
      flash.now[:alert] = '作成ができませんでした'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:notice] = '更新できました'
      redirect_to group_post_path(@post.group_id, @post.id)
    else
      flash.now[:alert] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash.now[:notice] = '削除できました'
      redirect_to root_path
    else
      flash.now[:alert] = '削除できませんでした'
      redirect_to root_path
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :total_price)
  end

end