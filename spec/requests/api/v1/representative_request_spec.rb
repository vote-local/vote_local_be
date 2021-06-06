require 'rails_helper'

RSpec.describe "Representatives Internal API", type: :request do
  describe "happy path" do

    it "returns representatives when address is given", :vcr do
      address = "1331 17th Street, Denver CO 80202"
      get "/api/v1/representatives?address=#{address}"

      expect(response).to be_successful

      representatives = JSON.parse(response.body, symbolize_names: true)

      expect(representatives).to be_a(Hash)
      expect(representatives[:data]).to be_a(Array)

      representatives[:data].each do |representative|
        expect(representative).to have_key(:id)
        expect(representative[:id]).to be_a(String)

        expect(representative).to have_key(:type)
        expect(representative[:type]).to be_a(String)

        expect(representative).to have_key(:attributes)
        expect(representative[:attributes]).to be_a(Hash)

        expect(representative[:attributes]).to have_key(:office_name)
        expect(representative[:attributes][:office_name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:representative_name)
        expect(representative[:attributes][:representative_name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:party)
        expect(representative[:attributes][:party]).to be_a(String)

        expect(representative[:attributes]).to have_key(:urls)
        expect(representative[:attributes][:urls]).to be_a(String)

        expect(representative[:attributes]).to have_key(:photo_url)
        expect(representative[:attributes][:photo_url]).to be_a(String)

        expect(representative[:attributes]).to have_key(:office_name)
        expect(representative[:attributes][:office_name]).to be_a(String)

        expect(representative[:attributes]).to have_key(:twitter_handle)
        expect(representative[:attributes][:twitter_handle]).to be_a(String)
      end
    end
  end
end
