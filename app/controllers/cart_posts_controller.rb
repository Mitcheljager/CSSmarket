class CartPostsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def create
    @cart_post = CartPost.new cart_item_params

    if !current_user
      redirect_to "/login"
    else
      if @cart_post.save
        redirect_to cart_path
      else
        redirect_to cart_path, flash: { error: "Product was already in cart" }
      end
    end
  end

  def destroy
    @cart_post = CartPost.find_by_cart_id_and_post_id(session[:cart_id], params[:id])

    @cart_post.destroy
  end

  private

    def set_cart_post
      @cart_post = CartPost.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_post).permit(:post_id, :cart_id)
    end
end
