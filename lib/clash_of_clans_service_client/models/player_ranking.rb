module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # tag
    # name
    # exp_level
    # tropies
    # attack_wins
    # rank
    # previous_rank
    # clan
    #   tag
    #   name
    #   badge_urls
    #     small
    #     large
    #     medium
    class PlayerRanking < Ranking
      collection_path 'locations/:location_id/rankings/players'
      belongs_to :clan
    end
  end
end
