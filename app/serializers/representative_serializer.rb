class RepresentativeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :party, :url, :photoUrl
end
