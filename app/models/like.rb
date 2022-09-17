class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_create :update_like
  def update_like
    post.increment!(:likes_counter)
  end
end
