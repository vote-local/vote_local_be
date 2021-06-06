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
    if data[:channels] != nil
      handle = data[:channels].find do |channel|
        channel[:type] == "Twitter"
      end
      handle[:id]
    end
  end
end
