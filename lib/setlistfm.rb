require 'setlistfm/request'

class Setlistfm
  include Request
  attr_accessor :api_key, :url

  def initialize(api_key = ENV['SETLISTFM_API_KEY'])
    raise 'API key is required' unless api_key
    @api_key = api_key
    @url = Request.base_url
  end
end
