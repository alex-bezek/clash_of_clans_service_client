$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'clash_of_clans_service_client'
require 'json'
require 'byebug'
require 'clash_of_clans_service_client/models'

# TODO: Implement json fixtures for incorrect requests (not enough params, unauthorized, etc)

RSpec.configure do |config|
  # Load our json result data once
  config.before(:all) do
    @leagues_index = JSON.parse(File.read(File.expand_path('spec/fixtures/leagues/index.json')))
    @locations_index = JSON.parse(File.read(File.expand_path('spec/fixtures/locations/index.json')))
    @player_rankings = JSON.parse(File.read(File.expand_path('spec/fixtures/locations/rankings/players.json')))
    @clan_rankings = JSON.parse(File.read(File.expand_path('spec/fixtures/locations/rankings/clans.json')))
    @clans_index = JSON.parse(File.read(File.expand_path('spec/fixtures/clans/index.json')))
    @clans_show = JSON.parse(File.read(File.expand_path('spec/fixtures/clans/show.json')))
  end

  config.include(Module.new do
    def stub_api_for(klass)
      klass.use_api(api = Her::API.new)

      api.setup url: 'http://api.example.com' do |c|
        c.use Faraday::Request::UrlEncoded
        c.use ClashOfClansServiceClient::FaradayMiddleware::MyCustomParser
        c.adapter(:test) { |s| yield(s) }
      end
    end
  end)
end
