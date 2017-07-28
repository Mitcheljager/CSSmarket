class ChargesController < ApplicationController
  def new
    cart
  end

  def create
    cart

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @total_price * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

    session.delete(:cart_id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def cart
      @cart = session[:cart_id]
      @cart_posts = CartPost.where(cart_id: @cart).all
      @posts = []
      @total_price = 0

      @cart_posts.each do |post|
        tposts = Post.where(id: post.post_id).order("created_at DESC")
        @posts += tposts if tposts
      end

      @posts.each do |post|
        @total_price += post.price.to_i
      end
    end
end
