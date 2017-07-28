class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :posts, :carts do |t|
      t.integer :post_id
      t.integer :cart_id
    end
  end
end
