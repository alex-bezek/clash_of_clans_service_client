module ClashOfClansServiceClient
  module Models
    class Base
      include Her::Model
      uses_api ClashOfClansServiceClient.api

      def method_missing(method, *args, &block)
        # byebug if self.class == ClashOfClansServiceClient::Models::Member
        if method.to_s.end_with? '?'
          # converts country? to isCountry
          actual_method = ('is' + method.to_s.camelize.chop).to_sym
        else
          # converts country_code to countryCode
          actual_method = method.to_s.camelize(:lower).to_sym
        end

        # Protect from infinite loop
        if (respond_to? actual_method) && (!respond_to? method)
          alias_method actual_method method
          send(actual_method, *args, &block)
        end
      end

      # TODO: If an endpoint only supports all or find, then override where and filter the results of all with
      # the attributes passed into where

      # TODO: Go through and identify useful helper functions such as member.leader
    end
  end
end
