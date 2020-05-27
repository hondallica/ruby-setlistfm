# frozen_string_literal: true

require 'setlistfm/version'
require 'setlistfm/request'
require 'setlistfm/api_method'

class Setlistfm
  include Version
  include Request
  include APIMethod
  attr_accessor :api_key, :url, :version, :api_version

  def initialize(api_key = ENV['SETLISTFM_API_KEY'])
    raise 'API key is required' unless api_key

    @version = Version.version
    @api_version = Version.api_version
    @api_key = api_key
    @url = Request.base_url
  end
end
