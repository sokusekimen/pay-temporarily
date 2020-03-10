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
      flash[:notice] = '作成ができました'
      redirect_to group_post_path(@post.group_id, @post.id)
    else
      flash[:alert] = '作成ができませんでした'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = '更新できました'
      redirect_to group_post_path(@post.group_id, @post.id)
    else
      flash[:alert] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:alert] = '削除できました'
      redirect_to group_path(@post.group_id)
    else
      flash[:alert] = '削除できませんでした'
      redirect_to group_post_path(@post.group_id, @post.id)
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