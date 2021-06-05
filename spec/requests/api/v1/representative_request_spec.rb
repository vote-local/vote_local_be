# require 'rails_helper'

# RSpec.describe "Election API" do
#   describe "happy path" do
#   it "returns information about an election" do

#     get '/api/vi/elections/7035'

#     expect(response).to be_successful

#     expect(response[:body]).to be_a(Hash)

    # {
    #   "data": {
    #     "attributes": {
    #       "id": Integer,
    #       "electionId": Integer,
    #       "name": "String,
    #       "dateOfElection": dateTime,
    #       "office": {"NameOfOffice" => {"CanidatesForOffice" => {policiesInfo => "" ,
    #         photoURL => "",
    #         ect => ""} } }
    #       }
    #     }
    #   }


#   end
# end

#   describe "sad path" do
#     it "returns a 404 if the election is not found"
#   end

#   describe "edge case" do
#   end
# end
