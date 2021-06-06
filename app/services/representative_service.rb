class RepresentativeService
  class << self

    def get_representatives_by_address(address)
      response = conn.get("representatives") do |req|
        req.params['address'] = address
        req.options.params_encoder = Faraday::FlatParamsEncoder
        req.params['levels'] = [
          'administrativeArea1',
          'administrativeArea2',
          'locality',
          'regional',
          'special',
          'subLocality1',
          'subLocality2'
        ]
      end
      parse_data(response)
    end

  private

    def conn
      Faraday.new(
        url: 'https://www.googleapis.com/civicinfo/v2',
        params: {
          "key" => "#{ENV['GOOGLE_CIVICS_API_KEY']}"
          })
        end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
