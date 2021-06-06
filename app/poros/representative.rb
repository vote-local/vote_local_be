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
    @twitter_handle = twitter(data)
  end

  def twitter(data)
    if data[:channels]
      data[:channels].find do |channel|
        if channel[:type] == "Twitter"
          channel[:id]
        else
          "not found"
        end
      end
    else
      "not found"
    end
  end
end
