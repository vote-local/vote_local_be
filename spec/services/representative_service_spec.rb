require 'rails_helper'

RSpec.describe RepresentativeService do
  it "returns correct structure for get elections query", :vcr do
    address = "99 E. Arizona St, Denver CO 80210"
    response = RepresentativeService.get_representatives_by_address(address)
require "pry"; binding.pry
    expect(response).to be_a(Hash)
    expect(response[:offices]).to be_a(Array)
    response[:offices].each do |office|
      expect(office[:name]).to be_a(String)
      expect(office[:officialIndices]).to be_a(Array)
    end
    expect(response[:officials]).to be_a(Array)
    response[:officials].each do |official|
      expect(official[:name]).to be_a(String)
      expect(official[:party]).to be_a(String)
      expect(official[:urls]).to be_a(Array)
      expect(official[:urls][0]).to be_a(String)
      if official[:channels] != nil
        expect(official[:channels]).to be_a(Array)
        # twitter = data[:officials].map do |official|
        #       if official[:channels] != nil
        #         handle = official[:channels].find do |channel|
        #           channel[:type] == "Twitter"
        #         end
        #         handle
        #       end
        #     end
      #   end
      end
    end
  end
end
