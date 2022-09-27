require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Martins',
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', bio: 'i am designer')
    @id = @user.id
    @post = Post.create(title: 'test post', author: @user, text: 'my test post')
  end
  describe 'test' do
    it 'displays profile picture for user' do
      visit "users/#{@id}"
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    it 'displays user name' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.name)
    end

    it 'shows number of post user has written' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.posts_counter)
    end
    it 'shows user bio' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.bio)
    end
    it 'shows the first 3 post' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.posts.length)
    end
    it 'displays a button that opens a link' do
      visit "users/#{@id}"
      expect(page).to have_link('See all posts')
      click_on 'See all posts'
      expect(current_path).to eql "/users/#{@id}/posts"
    end
  end
end
