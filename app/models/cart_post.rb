class CartPost < ApplicationRecord
  belongs_to :post
  belongs_to :cart

  validates :post_id, uniqueness: { scope: :cart_id }
end
