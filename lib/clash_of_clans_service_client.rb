require 'clash_of_clans_service_client/version'
require 'her'
require 'clash_of_clans_service_client/exception'
require 'clash_of_clans_service_client/faraday_middleware'
require 'clash_of_clans_service_client/rails/railtie.rb' if defined?(Rails)

module ClashOfClansServiceClient
  class << self
    attr_accessor :api

    def locations
      ClashOfClansServiceClient::Models::Location
    end

    def leagues
      ClashOfClansServiceClient::Models::League
    end

    def player_rankings
      ClashOfClansServiceClient::Models::PlayerRanking
    end

    def clan_rankings
      ClashOfClansServiceClient::Models::ClanRanking
    end

    def clans
      ClashOfClansServiceClient::Models::Clan
    end

    def members
      ClashOfClansServiceClient::Models::Member
    end

    def initialize(api_key)
      self.api = Her::API.new url: 'https://api.clashofclans.com/v1/' do |c|
        c.use FaradayMiddleware::MyAuthenticationToken, api_key
        # Request
        c.use Faraday::Request::UrlEncoded
        # Response
        c.use FaradayMiddleware::MyCustomParser
        # Adapter
        c.use Faraday::Adapter::NetHttp
      end

      # Models must be included after Her is initialized
      require 'clash_of_clans_service_client/models'
    end
  end
end
