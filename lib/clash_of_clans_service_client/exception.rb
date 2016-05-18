module ClashOfClansServiceClient
  class ClashOfClansServiceClientError < StandardError
    attr_reader :status, :endpoint, :body

    def initialize(status = 500, endpoint, body)
      @status = status
      @endpoint = endpoint
      @body = body
    end

    def message
      "status: #{@status}\nendpoint: #{@endpoint}\n#{@body}"
    end
  end

  class BadRequestError < ClashOfClansServiceClientError
  end

  class UnauthorizedRequestError < ClashOfClansServiceClientError
  end

  class ForbiddenRequestError < ClashOfClansServiceClientError
  end

  class ResourceNotFoundError < ClashOfClansServiceClientError
  end

  class UnprocessableEntityError < ClashOfClansServiceClientError
  end

  class BadHttpResponseError < ClashOfClansServiceClientError
  end

  class ConfigurationError < StandardError
  end

  class InvalidResource < StandardError
  end

  class InvalidOperation < StandardError
  end
end
