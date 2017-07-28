class RenameCartsPostsToCartPosts < ActiveRecord::Migration[5.0]
  def change
    rename_table :carts_posts, :cart_posts
  end
end
