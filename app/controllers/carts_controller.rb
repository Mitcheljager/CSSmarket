class CartsController < ApplicationController
  def index
    @cart = session[:cart_id]
    @cart_posts = CartPost.where(cart_id: @cart).all
    @posts = []

    @cart_posts.each do |post|
      tposts = Post.where(id: post.post_id).order("created_at DESC")
      @posts += tposts if tposts
    end
  end
end
