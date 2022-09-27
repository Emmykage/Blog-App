require 'rails_helper'

RSpec.describe 'test for post index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Poland.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    @id = @user.id
    @p_id = @post.id
    visit "users/#{@id}/posts/#{@p_id}"
  end

  it 'shows post title' do
    expect(page).to have_content(@post.title)
  end

  it 'shows post author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'shows number of comment' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'shows the post body' do
    expect(page).to have_content(@post.text)
  end

  it 'displays commentors username' do
    expect(page).to have_content(@comment.author.name)
  end
end
