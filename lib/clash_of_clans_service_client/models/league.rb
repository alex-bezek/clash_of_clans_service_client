module ClashOfClansServiceClient
  module Models
    # Attributes
    #
    # id
    # name
    # icon_urls
    #   small
    #   tiny
    #   medium
    #
    # Endpoints
    # /leauge
    class League < Base
      belongs_to :iconUrls, class_name: 'IconUrls'
    end
  end
end
