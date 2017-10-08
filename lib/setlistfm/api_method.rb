module APIMethod
  def artist(mbid)
    http.get("/rest/#{api_version}/artist/#{mbid}")
  end

  def artist_setlists(mbid, params = {})
    http.get("/rest/#{api_version}/artist/#{mbid}/setlists", params)
  end

  def city(geoid)
    http.get("/rest/#{api_version}/city/#{geoid}")
  end

  def search_artists(params = {})
    http.get("/rest/#{api_version}/search/artists", params)
  end
end
