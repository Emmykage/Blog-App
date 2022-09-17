require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    test_user = User.create(name: 'yankee', bio: 'Teacher from Abuja', posts_counter: 0)
    test_post = Post.create(author: test_user, title: 'testing', text: 'thanks for testing this', comments_counter: 0,
                            likes_counter: 0)
    Comment.new(author: test_user, post: test_post, text: 'hey thanks for having me ')
  end
  before { subject.save }

  it 'updates comment counter post' do
    expect(subject.post.comments_counter).to eq 1
  end
  it ' user comment should be yankee' do
    expect(subject.post.author.name).to eq 'yankee'
  end
end
