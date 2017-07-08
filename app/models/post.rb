class Post < ActiveRecord::Base
  attribute :user_name, :string

  validates :title, presence: true, length: { minimum: 8 }, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :user_id, presence: true
end
