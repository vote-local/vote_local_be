# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepresentativeService do
  it 'returns correct structure for get representatives query based on address', :vcr do
    address = '1331 17th Street, Denver CO 80202'
    response = RepresentativeService.get_representatives_by_address(address)
    expect(response).to be_a(Hash)
    expect(response[:offices]).to be_a(Array)
    expect(response[:levels]).to_not eq('country')

    response[:offices].each do |office|
      expect(office[:name]).to be_a(String)
      expect(office[:officialIndices]).to be_a(Array)
    end

    expect(response[:officials]).to be_a(Array)

    response[:officials].each do |official|
      expect(official[:name]).to be_a(String)
      expect(official[:party]).to be_a(String)
      expect(official[:urls]).to be_a(Array)
      expect(official[:photoUrl]).to be_a(String) unless official[:photoUrl].nil?
      expect(official[:urls][0]).to be_a(String)
      next if official[:channels].nil?

      expect(official[:channels]).to be_a(Array)
      handle = official[:channels].find do |channel|
        channel[:type] == 'Twitter'
      end
      expect(handle[:id]).to be_a(String) unless handle.nil?
    end
  end
end
