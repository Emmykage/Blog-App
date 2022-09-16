require 'rails_helper'

RSpec.describe Post, type: :model do
  # Create post

  subject { Post.create(author: User.new(name: 'morris'), title: 'test_title', text: 'test text') }

  it 'should not allow empty title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be bigger or equal than 0' do
    expect(subject.comments_counter).to be >= 0
    subject.comments_counter = -1
  end

  it 'LikesCounter should be bigger or equal than 0' do
    expect(subject.likes_counter).to be >= 0
  end

  it 'UpdatePostsCounter to increase on new posts' do
    expect(subject.author.posts_counter).to be 1
  end

  it 'FiveMostRecentComments length should be between 0 and 5' do
    expect(subject.five_most_recent_comments).to be_kind_of Array
    expect(subject.five_most_recent_comments.length).to be_between(0, 5)
  end
end
