module ClashOfClansServiceClient
  module FaradayMiddleware
    class MyCustomParser < Faraday::Response::Middleware
      def on_complete(env)
        status = env[:status]
        body = env[:body]
        endpoint = env[:url]
        
        # Check for bad status codes
        case status
        # Default case where we provide our custom parsing
        when 200, 201, 204 then
          json = MultiJson.load(body, symbolize_keys: true)
          # ClashOfClans api returns json in the format of a hash with an items element
          # containing the array of resources
          if json.key? :items
            env[:body] = { data: json[:items] }
          else
            env[:body] = { data: json }
          end
        when 400 then raise BadRequestError.new(status, endpoint, body)
        when 401 then raise UnauthorizedRequestError.new(status, endpoint, body)
        when 403 then raise ForbiddenRequestError.new(status, endpoint, body)
        when 404 then raise ResourceNotFoundError.new(status, endpoint, 'Resource Not Found')
        when 422 then raise UnprocessableEntityError.new(status, endpoint, body)
        else raise BadHttpResponseError.new(status, endpoint, body)
        end

      end
    end
  end
end
