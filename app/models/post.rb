class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  after_create :post_counter_update

  def post_counter_update
    author.posts_counter = 0 unless author.posts_counter?
    author.posts_counter += 1
    author.save
  end

  def top_five
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end
end
