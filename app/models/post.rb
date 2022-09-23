class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :post_counter_update

  def post_counter_update
    author.posts_counter = 0 unless author.posts_counter?
    author.posts_counter += 1
    # author.increment!(:posts_counter)
  end

  def top_five
    Comment.where(post: self).order(created_at: :desc).first(5)
    # comments.includes(:post).order(created_at: :desc).limit(5)
    # comments.order(created_at: :desc).limit(5)
    # comments.includes([:author]).order(created_at: :desc).limit(5)--senior
  end
end
