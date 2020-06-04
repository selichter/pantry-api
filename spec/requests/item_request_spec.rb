require 'rails_helper'

RSpec.describe 'Item endpoints', type: :request do
  let(:valid_attributes) { { name: 'steak', amount: 1 } }
  items_url = '/api/v1/items/'

  describe 'POST' do
    it 'creates an item' do
      post items_url, { params: { item: valid_attributes } }

      expect(response).to have_http_status(:created)
    end

    it 'returns error on create an item with missing amount' do
      post items_url, { params: { item: { name: 'steak' } } }
      error_response = JSON.parse(response.body)['data']

      expect(response.status).to eq(400)
      expect(error_response['amount']).to eq(["can't be blank", 'is not a number'])
    end

    it 'returns error on create an item with missing name' do
      post items_url, { params: { item: { amount: 3 } } }
      error_response = JSON.parse(response.body)['data']

      expect(response.status).to eq(400)
      expect(error_response['name']).to eq(["can't be blank"])
    end
  end

  describe 'GET' do
    it 'gets all items' do
      Item.create valid_attributes
      Item.create({ name: 'chicken', amount: 4 })
      get items_url

      item_response = JSON.parse(response.body)
      first_item = item_response[0]
      second_item = item_response[1]

      expect(response.status).to eq(200)
      expect(first_item['amount']).to eq(1)
      expect(first_item['name']).to eq('steak')

      expect(second_item['amount']).to eq(4)
      expect(second_item['name']).to eq('chicken')
    end

    it 'returns an empty list when there are no items' do
      get items_url

      item_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item_response).to eq([])
    end
  end

  describe 'GET item by Id' do
    it 'gets item by id' do
      item = Item.create valid_attributes
      get "#{items_url}#{item.id}"

      item_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item_response['amount']).to eq(1)
      expect(item_response['name']).to eq('steak')
    end

    it 'returns not found with id that does not exist' do
      get "#{items_url}789"
      expect(response.status).to eq(404)
    end
  end

  describe 'PUT' do
    it 'updates an item properly' do
      item = Item.create valid_attributes

      put "#{items_url}#{item.id}", params: { item: { amount: 77 } }
      item.reload
      expect(response.status).to be(201)
      expect(item.amount).to eq(77)
    end

    it 'raises bad request error when it cannot update an item' do
      item = Item.create valid_attributes

      put "#{items_url}#{item.id}", params: { item: { amount: 'seventy-seven' } }
      item.reload
      expect(response.status).to be(400)
      expect(item.amount).to eq(1)
    end
  end
end
