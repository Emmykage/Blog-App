class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :comment_counter_update

  def comment_counter_update
    post.increment!(:comments_counter)
  end
end
