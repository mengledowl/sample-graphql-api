class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def full_name
    [first_name, last_name].join(' ')
  end
end
