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

  def search_cities(params = {})
    http.get("/rest/#{api_version}/search/cities", params)
  end

  def search_countries(params = {})
    http.get("/rest/#{api_version}/search/countries", params)
  end

  def search_setlists(params = {})
    http.get("/rest/#{api_version}/search/setlists", params)
  end

  def search_venues(params = {})
    http.get("/rest/#{api_version}/search/venues", params)
  end

  def setlist_version(version_id, params = {})
    http.get("/rest/#{api_version}/setlist/version/#{version_id}", params)
  end
end
