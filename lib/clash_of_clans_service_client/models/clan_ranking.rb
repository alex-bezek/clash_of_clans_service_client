module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # tag
    # name
    # location
    #   id
    #   name
    #   isCountry
    #   countryCode
    # badge_urls
    #   small
    #   large
    #   medium
    # clan_level
    # members
    # clan_points
    # rank
    # previous_rank
    class ClanRanking < Ranking
      collection_path 'locations/:location_id/rankings/clans'
      belongs_to :location
      belongs_to :badgeUrls, class_name: 'BadgeUrls'
      belongs_to :location
    end
  end
end
