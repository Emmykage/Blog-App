require 'rails_helper'

Rspec.describe Comment, type: :model do
  test_user = User.create(name: 'yankee', bio: 'Teacher from Abuja')
  test_post = Post.create(author: test_user, title: 'testing', text: 'thanks for testing this')
  subject { Comment.new(author: test_user, post: test_post, text: 'hey thanks for having me ') }

  it 'updates comment counter post' do
    expect(subject.post.comments_counter).to be 1
  end
  it ' user comment should be David' do
    expect(subject.post.author.name).to be 'yankee'
  end
end
