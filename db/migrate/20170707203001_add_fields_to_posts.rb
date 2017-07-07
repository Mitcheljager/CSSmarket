class AddFieldsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :price, :string
    add_column :posts, :description, :string
    add_column :posts, :image, :string
  end
end
