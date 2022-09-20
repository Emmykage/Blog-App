require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'check for response status ok' do
    it 'returns a 200 OK status' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end

RSpec.describe 'User management', type: :request do
  it 'direct and renders user page' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'directs and renders unique user page' do
    get '/users/2'
    expect(response).to render_template(:show)
  end

  it 'the response includes correctt placeholder text' do
    get '/users'
    expect(response.body).to include('Here is a list of users')
  end

  it 'response includes correct placeholder' do
    get '/users/2'
    expect(response.body).to include('Here is the profile for User 2')
  end
end
