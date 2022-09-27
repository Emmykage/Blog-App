require 'rails_helper'

RSpec.describe 'test for post index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Poland.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
  end

  it 'shows the name of the author' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content(@user.name)
  end

  it 'shows post title' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content(@post.title)
  end

  it 'shows number of comment for a post' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it 'shows the number of like for a post' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end
  it 'shows profile photo' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_css("img[src='#{@user.photo}']")
  end
  it 'redirected to post page' do
    visit "users/#{@user.id}/posts"
    click_link(@post.title)
    visit "users/#{@user.id}/posts/#{post.id}"
  end

  it 'shows some post content ' do
    visit "users/#{@user.id}/posts"
    expect(page).to have_content(@post.text)
  end
end
