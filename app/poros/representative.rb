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
    @photo_url = data[:photoUrl] || avatar_url
    @office_name = data[:office_name]
    @twitter_handle = twitter(data)
    @api_id = "#{data[:address][0][:zip]}#{data[:name].delete(' ').gsub(/[!@%&",.]/,'')}"
  end

  def twitter(data)
    handle = 'not found'
    data[:channels]&.each do |channel|
      handle = channel[:id] if channel[:type] == 'Twitter'
    end
    handle
  end

  def avatar_url
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
  end
end
