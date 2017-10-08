module APIMethod
  def artist(mbid)
    http.get("/rest/#{api_version}/artist/#{mbid}")
  end
end
