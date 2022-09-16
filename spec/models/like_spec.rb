require 'rails_helper'

RSpec.describe Like, type: :model do
  test_user = User.create(name: 'Yankee', bio: 'Test fro NIgeria')
  test_post = Post.create(author: test_user, title: 'test post', text: 'this is my test post')

  subject { Like.create(author: test_user, post: test_post) }

  it 'UpdatesLikesCounter increments post likes_counter' do
    expect(subject.post.likes_counter).to be 1
  end
end
