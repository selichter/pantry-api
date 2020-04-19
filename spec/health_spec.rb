require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  include Capybara::DSL

  describe 'GET index' do
    it 'returns health json' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq('something else')
    end
  end
end
