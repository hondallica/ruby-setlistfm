class Setlistfm
  attr_accessor :api_key

  def initialize(api_key = ENV['SETLISTFM_API_KEY'])
    raise 'API key is required' unless api_key
    @api_key = api_key
  end
end
