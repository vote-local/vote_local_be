# frozen_string_literal: true

require 'rails_helper'

describe 'RepresentativesFacade', :vcr do
  it 'returns an array of representative objects' do
    address = '1331 17th Street, Denver CO 80202'
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives).to be_a(Array)
    expect(representatives.first).to be_an_instance_of(Representative)
  end

  it 'returns data to poro to allow it to return readable attributes' do
    address = '1331 17th Street, Denver CO 80202'
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives.first.name).to eq('Jared Polis')
    expect(representatives.first.party).to eq('Democratic Party')
    expect(representatives.first.url).to eq('https://www.colorado.gov/governor/')
    expect(representatives.first.photo_url).to eq('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')
    expect(representatives.first.id).to eq(nil)
    expect(representatives.first.office_name).to eq('Governor of Colorado')
    expect(representatives.first.twitter_handle).to eq('jaredpolis')
  end

  it 'returns not found if  representative has no twitter_handle' do
    address = '1331 17th Street, Denver CO 80202'
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives[14].name).to eq("Timothy M. O'Brien")
    expect(representatives[14].party).to eq('Nonpartisan')
    expect(representatives[14].url).to eq('https://denverauditor.org/')
    expect(representatives[14].photo_url).to eq('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')
    expect(representatives[14].id).to eq(nil)
    expect(representatives[14].office_name).to eq('Denver City Auditor')
    expect(representatives[14].twitter_handle).to eq('not found')
  end

  it 'it matches a representative with their correct office' do
    address = '1331 17th Street, Denver CO 80202'
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives[6].name).to eq('Monica M. Márquez')
    expect(representatives[6].party).to eq('Nonpartisan')
    expect(representatives[6].office_name).to eq('CO Supreme Court Justice')
  end
end
