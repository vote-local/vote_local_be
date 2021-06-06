class RepresentativeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :party, :urls, :photoUrl
end
