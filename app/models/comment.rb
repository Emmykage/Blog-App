class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :comment_counter_update

  def comment_counter_update
    post.comments_counter 0 unless Post.comments_counter?
    post.comments_counter += 1
    post.save
  end
end
