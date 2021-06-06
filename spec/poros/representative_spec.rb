require 'rails_helper'

RSpec.describe "Representative PORO" do
  it "abstracts and encapsulates representative data that is readable", :vcr do
    data = File.read("spec/fixtures/representative_info.json")
    response = JSON.parse(data, symbolize_names: true)
    # address = "2000 16th St, Denver CO"
    # representatives = RepresentativesFacade.get_representatives(address)
    representative = Representative.new(response)
    expect(representative.name).to eq("Jared Polis")
  end
end