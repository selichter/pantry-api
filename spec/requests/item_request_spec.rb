require 'rails_helper'

RSpec.describe 'Item endpoints', type: :request do
  let(:valid_attributes) { { name: 'steak', amount: 1 } }

  describe 'POST' do
    it 'creates an item' do
      post '/items', { params: { item: valid_attributes } }

      expect(response).to have_http_status(:created)
    end

    it 'returns error on create an item with missing amount' do
      post '/items', { params: { item: { name: 'steak' } } }
      error_response = JSON.parse(response.body)['data']

      expect(response.status).to eq(400)
      expect(error_response['amount']).to eq(["can't be blank", "is not a number"])
    end

    it 'returns error on create an item with missing name' do
      post '/items', { params: { item: { amount: 3 } } }
      error_response = JSON.parse(response.body)['data']

      expect(response.status).to eq(400)
      expect(error_response['name']).to eq(["can't be blank"])
    end
  end

  describe 'GET' do

    it 'gets all items' do
      Item.create valid_attributes
      Item.create({name: 'chicken', amount: 4})
      get '/items'

      item_response = JSON.parse(response.body)
      first_item = item_response[0]
      second_item = item_response[1]

      expect(response.status).to eq(200)
      expect(first_item['amount']).to eq(1)
      expect(first_item['name']).to eq('steak')

      expect(second_item['amount']).to eq(4)
      expect(second_item['name']).to eq('chicken')
    end

    it 'returns an empty list when there are now items' do
      get '/items'

      item_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item_response).to eq([])
    end
  end

end
