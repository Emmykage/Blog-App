class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_create :update_like
  def update_like
    posts.likes_counter = 0 unless post.likes_counter?
    post.likes_counter += 1
    post.save
  end
end
