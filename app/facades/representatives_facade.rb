class RepresentativesFacade
  class << self
    def fetch_representative_data(address)
      data ||= RepresentativeService.get_representatives_by_address(address)
    end

    def get_representatives(address)
      data = fetch_representative_data(address)
      representatives = []
      data[:officials].each_with_index do |official, index|
        next unless official[:office_name].nil?
        data[:offices].each do |office|
          official[:office_name] = office[:name] if office[:officialIndices].include?(index)
        end
        representatives << Representative.new(official)
      end
      representatives
    end
  end
end
