require 'faraday'
require 'faraday_middleware'

module Request
  def base_url(url = 'https://api.setlist.fm')
    url
  end

  def http
    Faraday.new(url: base_url) do |f|
      f.request :url_encoded
      f.headers['x-api-key'] = @api_key
      f.headers['Accept'] = 'application/json'
      f.headers['User-Agent'] = "ruby-setlistfm/#{version}"
      f.adapter :net_http
    end
  end

  module_function :base_url
end
