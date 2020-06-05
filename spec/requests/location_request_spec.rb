require 'rails_helper'

RSpec.describe 'Location endpoints', type: :request do
  locations_url = '/api/v1/locations/'
  let(:valid_attributes) { { name: 'somewhere' } }
  location = FactoryBot.create(:location)

  describe 'POST' do
    it 'creates an location' do
      location_attrs = FactoryBot.attributes_for(:location)
      post locations_url, { params: { location: location_attrs } }

      expect(response).to have_http_status(:created)
    end

    it 'returns error on create an location with missing location' do
      expect { post locations_url, { params: { } } }.to raise_error ActionController::ParameterMissing
    end

    it 'returns error on create an location with missing amount' do
      expect { post locations_url, { params: { location: {} } } }.to raise_error ActionController::ParameterMissing
    end
  end

  describe 'GET' do
    it 'gets all locations' do
      get locations_url

      location_response = JSON.parse(response.body)
      first_location = location_response[0]

      expect(response.status).to eq(200)
      expect(first_location['name']).to eq('freezer')
    end

  end

  describe 'GET location by Id' do
    it 'gets location by id' do
      get "#{locations_url}#{location.id}"

      location_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(location_response['name']).to eq('freezer')
    end

    it 'returns not found with id that does not exist' do
      get "#{locations_url}789"
      expect(response.status).to eq(404)
    end
  end

end
