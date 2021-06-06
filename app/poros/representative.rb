class Representative
  attr_reader :name,
              :party,
              :url,
              :photoUrl,
              :id

  def initialize(data)
    @id = data[:index]
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls]
    @photoUrl = data[:photoUrl]
  end
end
