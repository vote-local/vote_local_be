class Representative
  attr_reader :name,
              :party,
              :url,
              :photoUrl,
              :id,
              :office_name

  def initialize(data)
    @id = nil
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls]
    @photoUrl = data[:photoUrl]
    @office_name = data[:office_name]
  end
end
