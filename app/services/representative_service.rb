class RepresentativeService
  class << self
    def conn
      Faraday.new(
          url: 'https://www.googleapis.com/civicinfo/v2/representatives',
          params: {
            "key" => "#{ENV["GOOGLE_CIVICS_API_KEY"]}"
            })
      end

    def get_representatives_by_address(address)
      response = conn.get(
        # url: "/representatives",
        :params => {
          "address" => address,
          "levels" => ["administrativeArea1", "administrativeArea2"]
        }
      )

      # :params => {:color => ['red', 'blue']}
      # response = conn.get("representatives") do |req|
      #   req.params['address'] = address
      #   req.params['levels'] = "administrativeArea1"
      #   req.params['&levels'] = "administrativeArea2"
      #   req.params['&levels'] = "locality"
      #   req.params['&levels'] = "regional"
      #   req.params['&levels'] = "special"
      #   req.params['&levels'] = "subLocality1"
      #   req.params['&levels'] = "subLocality2"
      # end
      parse_data(response)
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
