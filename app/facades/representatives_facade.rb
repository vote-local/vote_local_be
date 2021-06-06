class RepresentativesFacade
  class << self

    def get_representatives(address)
      data = RepresentativeService.get_representatives_by_address(address)
      representatives = []
      data[:officials].each_with_index do |official, index|
        if official[:index] == nil
          official[:index] = index
          representatives << Representative.new(official)
        end
      end
        representatives
    end
  end
end
