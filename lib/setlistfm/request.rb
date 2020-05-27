# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Request
  def base_url(url = 'https://api.setlist.fm')
    url
  end

  def http
    Faraday.new(url: base_url) do |f|
      f.response :mashify
      f.response :json
      f.request :url_encoded
      f.request :retry, max: 5, interval: 1.0
      f.options[:open_timeout] = 2
      f.options[:timeout] = 5
      f.headers['x-api-key'] = @api_key
      f.headers['Accept'] = 'application/json'
      f.headers['User-Agent'] = "ruby-setlistfm/#{version}"
      f.adapter :net_http
    end
  end

  module_function :base_url
end
