require 'rails_helper'

RSpec.describe "Representatives Internal API", type: :request do
  describe "happy path" do

    it "returns information representatives" do

      address = "1331 17th Street, Denver CO 80202"
      get "/api/v1/representatives?address=#{address}"

      response = JSON.parse(response, symbolize_names: true)

      expect(response).to be_successful

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Array)
      expect(response[:data]).to have_key(:id)
      expect(response[:data][:id]).to be_a(String)

      expect(response[:data]).to have_key(:type)
      expect(response[:data][:type]).to be_a(String)

      expect(response[:data]).to have_key(:attributes)
      expect(response[:data][:attributes]).to be_a(Hash)

      expect(response[:data][:attributes]).to have_key(:office_name)
      expect(response[:data][:attributes][:office_name]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:representative_name)
      expect(response[:data][:attributes][:representative_name]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:party)
      expect(response[:data][:attributes][:party]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:urls)
      expect(response[:data][:attributes][:urls]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:photo_url)
      expect(response[:data][:attributes][:photo_url]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:office_name)
      expect(response[:data][:attributes][:office_name]).to be_a(String)

      expect(response[:data][:attributes]).to have_key(:twitter_handle)
      expect(response[:data][:attributes][:twitter_handle]).to be_a(String)
    end
  end
end
