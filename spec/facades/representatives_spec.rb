require 'rails_helper'

describe "RepresentativesFacade", :vcr do
  it "returns an array of representative objects" do
    address = "1331 17th Street, Denver CO 80202"
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives).to be_a(Array)
    expect(representatives.first).to be_an_instance_of(Representative)
  end

  it "returns data to poro to allow it to return readable attributes" do
    address = "1331 17th Street, Denver CO 80202"
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives.first.name).to eq("Jared Polis")
    expect(representatives.first.party).to eq("Democratic Party")
    expect(representatives.first.url).to eq("https://www.colorado.gov/governor/")
    expect(representatives.first.photo_url).to eq("no photo found")
    expect(representatives.first.id).to eq(nil)
    expect(representatives.first.office_name).to eq("Governor of Colorado")
    expect(representatives.first.twitter_handle).to eq("jaredpolis")

    expect(representatives[14].name).to eq("Timothy M. O'Brien")
    expect(representatives[14].party).to eq("Nonpartisan")
    expect(representatives[14].url).to eq("https://denverauditor.org/")
    expect(representatives[14].photo_url).to eq("no photo found")
    expect(representatives[14].id).to eq(nil)
    expect(representatives[14].office_name).to eq("Denver City Auditor")
    expect(representatives[14].twitter_handle).to eq("not found")
  end
end
