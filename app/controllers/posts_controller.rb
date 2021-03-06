class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(session[:user]["id"])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @user = User.find(session[:user]["id"])
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = @user.posts.create!(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @user = User.find(session[:user]["id"])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :content, :user_id)

  end
end
