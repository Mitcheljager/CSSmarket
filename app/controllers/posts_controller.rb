class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def search
    if params[:q].nil?
      @posts = []
    else
      @posts = Post.search params[:q]
    end
  end

  private
    def post_params
      params.require(:post).permit :title, :content, :categories
    end
end