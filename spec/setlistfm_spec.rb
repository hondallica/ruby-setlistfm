require 'spec_helper'

RSpec.describe Setlistfm do
  context 'API Key' do
    it 'set an API key from argument' do
      api_key = 'your_api_key'
      setlistfm = Setlistfm.new(api_key)
      expect(setlistfm.api_key).to eq 'your_api_key'
    end

    it "set an API key from ENV['SETLISTFM_API_KEY']" do
      ENV['SETLISTFM_API_KEY'] = 'ENV_API_KEY'
      setlistfm = Setlistfm.new
      expect(setlistfm.api_key).to eq 'ENV_API_KEY'
    end

    it "not set ENV['SETLISTFM_API_KEY']" do
      ENV.reject! { |k| k == 'SETLISTFM_API_KEY' }
      expect { Setlistfm.new }.to raise_error(RuntimeError)
    end

    it 'update an API key' do
      api_key = 'your_api_key'
      setlistfm = Setlistfm.new(api_key)
      setlistfm.api_key = 'update_api_key'
      expect(setlistfm.api_key).to eq 'update_api_key'
    end
  end
end
