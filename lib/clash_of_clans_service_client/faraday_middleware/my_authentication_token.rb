module ClashOfClansServiceClient
  module FaradayMiddleware
    MyAuthenticationToken = Struct.new(:app, :token) do
      def call(env)

        env[:request_headers]['authorization'] = "Bearer #{token}"
        app.call(env)
      end
    end
  end
end
