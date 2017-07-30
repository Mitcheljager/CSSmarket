class DashboardController < ApplicationController
  def index
  end

  def downloads
    @succesful_orders = Order.where(user_id: current_user.id).all
    @posts = []

    @succesful_orders.each do |succesful_order|
      tposts = Post.where(id: succesful_order.post_id).order("created_at DESC")
      @posts += tposts if tposts
    end

    @posts.each do |post|
      user = User.select("id", "name").find_by_id(post.user_id)
      post.user_name = user.name
    end

    @total_posts = @posts ? @posts.count : 0
  end

  def earnings
    @succesful_orders = Order.where(user_id: current_user.id).all
    @total_earned = 0;

    @succesful_orders.each do |succesful_order|
      @total_earned += succesful_order.amount
    end
  end

  def projects
    @posts = Post.where(user_id: current_user.id).all
  end
end
