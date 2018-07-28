class Category < ApplicationRecord
  has_many :category_posts
  has_many :posts, through: :category_posts
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates_uniqueness_of :name
  

end