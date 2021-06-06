class Representative
  attr_reader :name

  def initialize(data)
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls]
    @photoUrl = data[:photoUrl]
    
  end
end