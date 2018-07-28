class Post < ApplicationRecord
  has_many :category_posts
  has_many :categories, through: :category_posts
  belongs_to :user
  validates :title, :body,  presence: true, length: {minimum: 3}
  validates :user_id , presence: true

end
