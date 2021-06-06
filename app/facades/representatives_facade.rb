class RepresentativesFacade
  class << self

    def fetch_representative_data(address)
      data ||= RepresentativeService.get_representatives_by_address(address)
    end

    def get_representatives(address)
      data = fetch_representative_data(address)
      representatives = []
      data[:officials].each_with_index do |official, index|
        if official[:office_name] == nil
          data[:offices].each do |office|
            if office[:officialIndices].include?(index)
              official[:office_name] = office[:name]
            end
          end
          representatives << Representative.new(official)
        end
      end
      representatives
    end
  end
end
