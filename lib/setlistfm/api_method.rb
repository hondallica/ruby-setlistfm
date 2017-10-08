module APIMethod
  def artist(mbid)
    http.get("/rest/#{api_version}/artist/#{mbid}")
  end

  def artist_setlists(mbid, params = {})
    http.get("/rest/#{api_version}/artist/#{mbid}/setlists", params)
  end
end
