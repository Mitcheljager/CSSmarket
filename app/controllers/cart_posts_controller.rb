class CartPostsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_post, only: [:destroy]

  def create
    @cart_post = CartPost.new cart_item_params

    if @cart_post.save
      redirect_to cart_path
    else
      redirect_to cart_path, :flash => { :error => "Product was already in cart" }
    end
  end

  def destroy
    @cart_post.destroy
    redirect_to cart_path
  end

  private

    def set_cart_post
      @cart_post = CartPost.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_post).permit(:post_id, :cart_id)
    end
end
