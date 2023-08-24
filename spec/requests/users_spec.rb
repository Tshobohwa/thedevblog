require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'includes the template content in the response body' do
      get '/users'
      expect(response.body).to include('<h1>Here is the list of all the users</h1>')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get '/users/1'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end
    it 'includes the template content in the response body' do
      get '/users/1'
      expect(response.body).to include('<h1>Here is a single user</h1>')
    end
  end
end
