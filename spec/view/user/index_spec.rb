require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Martins',
                        photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', bio: 'web developer')

    @id = @user.id
  end

  it 'should show username of all users' do
    visit users_path
    expect(page).to have_content(@user.name)
  end

  it 'should show post counter for user' do
    visit users_path
    expect(page).to have_content(@user.posts_counter)
  end

  it 'should show  redirected page on click' do
    visit users_path
    click_link(@user.name)
    expect(current_path).to eql "/users/#{@id}"
  end

  it 'should show profile photo' do
    visit users_path
    expect(page).to have_xpath("//img[contains(@src,'#{@user.photo}')]")
  end
end
