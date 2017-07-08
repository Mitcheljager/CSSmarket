class PostsController < ApplicationController
  before_action :authorize, except: [:show, :index, :search]

  def index
    @posts = Post.all

    @posts.each do |post|
      user = User.select("id", "name").find_by_id(post.user_id)
      post.user_name = user.name
    end
  end

  def show
    @post = Post.find params[:id]
    user = User.select("id", "name").find_by_id(@post.user_id)
    @post.user_name = user.name
  end

  def new
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id

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
      params.require(:post).permit :title, :content, :categories, :price, :image, :license
    end
end
