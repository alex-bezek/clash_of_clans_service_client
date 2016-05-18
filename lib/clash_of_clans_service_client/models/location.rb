module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # id
    # name
    # country?
    # country_code Note: Only available when initialized through the rankings endpoint
    class Location < Base

      # /locations/:location_id/rankings/players
      def player_rankings
        PlayerRanking.all(_location_id: id)
      end

      # /locations/:location_id/rankings/clans
      def clan_rankings
        ClanRanking.all(_location_id: id)
      end
    end
  end
end
