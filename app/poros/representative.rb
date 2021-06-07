class Representative
  attr_reader :name,
              :party,
              :url,
              :photo_url,
              :id,
              :office_name,
              :twitter_handle,
              :api_id

  def initialize(data)
    @id = nil
    @name = data[:name]
    @party = data[:party]
    @url = data[:urls][0]
    @photo_url = data[:photoUrl] || "no photo found"
    @office_name = data[:office_name]
    @twitter_handle = twitter(data)
    @api_id = "#{data[:address][0][:zip]}#{data[:name].delete(" ")}"
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
