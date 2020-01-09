class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.group_id = params[:group_id]
    if @post.save
      redirect_to group_post_path(@post.group_id, @post.id), notice: '作成ができました'
    else
      render :new, alert: '作成ができませんでした'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to group_post_path(@post.group_id, @post.id), notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '削除できました'
    else
      redirect_to root_path, alert: '削除できませんでした'
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
