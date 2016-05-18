module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # tag
    # name
    # type
    # location  Note: Only in where, not in find
    #   id
    #   name
    #   isCountry
    #   countryCode
    # badgeUrls
    #   small
    #   large
    #   medium
    # warFrequency
    # clanLevel
    # warWins
    # warWinStreak
    # clanPoints
    # requiredTrophies
    # members
    # membersList Note: only in find, not where
    #   tag
    #   name
    #   role
    #   expLevel
    #   league
    #     id
    #     name
    #     iconUrls
    #       small
    #       tiny
    #   trohpies
    #   clanRank
    #   previousClanRank
    #   donations
    #   donationsRecieved
    class Clan < Base
      # TODO: Override find, if it doesn't contain # or %23 add %23 to represent the url encoded version
      # TODO: Override all, must specify atleast 1 query string parameter
      belongs_to :location
      belongs_to :badgeUrls, class_name: 'BadgeUrls'
      has_many :memberList, class_name: 'Member'
    end
  end
end
