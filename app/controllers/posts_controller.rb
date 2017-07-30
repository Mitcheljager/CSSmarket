class PostsController < ApplicationController
  before_action :authorize, except: [:show, :index, :search]

  def index
    @posts = Post.all

    user_id_to_name
  end

  def show
    @post = Post.find params[:id]
    user = User.select("id", "name").find_by_id(@post.user_id)
    @post.user_name = user.name

    if current_user
      @has_ordered = Order.find_by_post_id_and_user_id(@post.id, current_user.id)
    end
  end

  def category
    @posts = Post.where(categories: params[:name]).all

    user_id_to_name
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

    def user_id_to_name
      @posts.each do |post|
        user = User.select("id", "name").find_by_id(post.user_id)
        post.user_name = user.name
      end
    end
end
