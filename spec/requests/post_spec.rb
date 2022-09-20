require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'checks for response status ok' do
    it 'returns a 200 OK status' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end

RSpec.describe 'Post management', type: :request do
  it 'it directs and render users/post pages ' do
    get '/users/2/posts'
    expect(response).to render_template(:index)
  end

  it ' directs and renders specific user posts' do
    get '/users/2/posts/4'
    expect(response).to render_template(:show)
  end

  it 'renders user posts to include correct placeholder text' do
    get '/users/2/posts'
    expect(response.body).to include('Here is a list of post for user 2')
  end

  it 'renders page to include correct placeholder text' do
    get '/users/2/posts/4'
    expect(response.body).to include('Here is the post 4 for user 2')
  end
end
