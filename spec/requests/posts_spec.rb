require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users/3/posts/'
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/users/3/posts/'
      expect(response).to render_template(:index)
    end
    it 'includes the template content in the response body' do
      get '/users/3/posts/'
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get '/users/3/posts/4'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/3/posts/4'
      expect(response).to render_template(:show)
    end
    it 'includes the template content in the response body' do
      get '/users/3/posts/4'
      expect(response.body).to include('<h1>Here is the given post of a user</h1>')
    end
  end
end
