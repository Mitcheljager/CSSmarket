class CartPost < ApplicationRecord
  belongs_to :post
  belongs_to :cart
end
