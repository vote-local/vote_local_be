class RepresentativeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :party, :url, :photo_url, :office_name, :twitter_handle
end
