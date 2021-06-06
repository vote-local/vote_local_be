require 'rails_helper'

describe "RepresentativesFacade" do
  it "returns an array of representative objects", :vcr do
    address = "1331 17th Street, Denver CO 80202"
    representatives = RepresentativesFacade.get_representatives(address)

    expect(representatives).to be_a(Array)
    expect(representatives.first).to be_an_instance_of(Representative)
  end

end
