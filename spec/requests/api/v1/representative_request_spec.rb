# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Representatives Internal API', type: :request do
  describe 'happy path' do
    it 'returns representatives when address is given', :vcr do
      address = '1331 17th Street, Denver CO 80202'
      get "/api/v1/representatives?address=#{address}"

      expect(response).to be_successful

      representatives = JSON.parse(response.body, symbolize_names: true)

      expect(representatives).to be_a(Hash)
      expect(representatives[:data]).to be_a(Array)

      representatives[:data].each do |representative|
        expect(representative).to have_key(:id)
        expect(representative[:id]).to eq(nil)

        expect(representative).to have_key(:type)
        expect(representative[:type]).to be_a(String)

        expect(representative).to have_key(:attributes)
        expect(representative[:attributes]).to be_a(Hash)

        expect(representative[:attributes]).to have_key(:office_name)
        expect(representative[:attributes][:office_name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:name)
        expect(representative[:attributes][:name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:party)
        expect(representative[:attributes][:party]).to be_a(String)

        expect(representative[:attributes]).to have_key(:url)
        expect(representative[:attributes][:url]).to be_a(String)

        expect(representative[:attributes]).to have_key(:photo_url)
        expect(representative[:attributes][:photo_url]).to be_a(String)

        expect(representative[:attributes]).to have_key(:office_name)
        expect(representative[:attributes][:office_name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:twitter_handle)
        expect(representative[:attributes][:twitter_handle]).to be_a(String)
      end
    end
  end

  describe 'sad path' do
    it 'returns error if address is empty', :vcr do
      address = ''
      get "/api/v1/representatives?address=#{address}"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it 'returns error if no address parameter is given', :vcr do
      get '/api/v1/representatives?'
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
