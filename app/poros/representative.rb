class Representative
  attr_reader :name,
              :party,
              :url,
              :photo_url,
              :id,
              :office_name,
              :twitter_handle

  def initialize(data)
    @id = nil
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls][0]
    @photo_url = data[:photoUrl] || "no photo found"
    @office_name = data[:office_name]
    @twitter_handle = twitter(data)
  end

  def twitter(data)
    handle = "not found"
    if data[:channels]
      data[:channels].each do |channel|
        if channel[:type] == "Twitter"
          handle = channel[:id]
        end
      end
    end
    handle
  end
end
