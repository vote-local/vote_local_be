class RepresentativesFacade
  class << self 
    
    def get_representatives(address)
      data = RepresentativeService.get_representatives_by_address(address)
      representatives = data[:officials].map do |official|
        Representative.new(official)
        binding.pry
      end
    end
  end
end