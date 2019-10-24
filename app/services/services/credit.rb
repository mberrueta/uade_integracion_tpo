require 'net/http'
require 'uri'
require 'json'

module Services
  class Credit < Base
    def register(employee)
      req =  {

      }

      request('employee', req.to_json)
    end

    private

    def base_url
      ENV['CREDIT_API']
    end

    def api_key
      ENV['CREDIT_KEY']
    end
  end
end