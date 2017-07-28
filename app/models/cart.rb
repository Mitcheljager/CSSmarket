class Cart < ApplicationRecord
  has_many :cart_posts
  has_many :posts, :through => :cart_posts

  def add_post(post_params)
    current_post = cart_posts.find_by(post_id: post_params[:post][:post_id])

    if current_post
    else
      new_post = cart_posts.create(post_id: post_params[:post][:post_id], cart_id: self.id)
    end
  end
end
