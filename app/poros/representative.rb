class Representative
  attr_reader :name,
              :party,
              :url,
              :photoUrl,
              :id

  def initialize(data)
    @id = rand(1..5000)
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls]
    @photoUrl = data[:photoUrl]
  end
end
