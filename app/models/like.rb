class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :update_like
  def update_like
    post.increment!(:likes_counter)
  end
end
