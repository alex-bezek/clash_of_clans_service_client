module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # tag
    # name
    # role
    # expLevel
    # league
    #   id
    #   name
    #   iconUrls
    #     small
    #     tiny
    class Member < Base
      collection_path 'clans/:clan_id/members'
      belongs_to :league
    end
  end
end
