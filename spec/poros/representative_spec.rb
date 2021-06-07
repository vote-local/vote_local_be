# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Representative PORO' do
  it 'abstracts and encapsulates representative data that is readable' do
    data = File.read('spec/fixtures/representative_info.json')
    response = JSON.parse(data, symbolize_names: true)
    representative = Representative.new(response)
    expect(representative.name).to eq('Jared Polis')
    expect(representative.api_id).to eq('80203JaredPolis')
  end

  it 'returns a twitter handle for the representative' do
    data = File.read('spec/fixtures/representative_info.json')
    response = JSON.parse(data, symbolize_names: true)
    rep = Representative.new(response)
    handle = rep.twitter(response)

    expect(handle).to eq('jaredpolis')
  end
end
