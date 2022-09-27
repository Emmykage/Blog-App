require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(
    name: 'Yankee',
    photo: 'https://www.pexels.com/photo/silhouette-of-a-person-on-a-swing-3293148/',
    bio: "I'm a student at Microverse",
    posts_counter: 0
  )

  subject do
    Comment.new(
      post: Post.new(
        author: user,
        title: 'Title',
        text: 'Text',
        comments_counter: 0,
        likes_counter: 0
      ),
      author: user,
      text: 'This is my comment :)'
    )
  end

  describe 'updates comment counter post' do
    # it 'should update the comments counter' do
    #   expect(subject.send(:update_comments_counter)).to be_valid
    # end
    it 'updates comment counter post' do
      expect(subject.post.comments_counter).to eq 1
    end
    it ' user comment should be yankee' do
      expect(subject.post.author.name).to eq 'yankee'
    end
  end
end
comment_counter_update