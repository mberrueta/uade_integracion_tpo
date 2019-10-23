require 'net/http'
require 'uri'
require 'json'

module Services
  class Payment
    def charge_account(origin_account_id, amount)
      req =  {
        cuit: employee.cuil.remove('-'),
        clientCuit: api_key,
        firstName: employee.name,
        lastName: employee.last_name
      }

      response = request('/employee', req.to_json)
    end

    private

    def base_url
      ENV['AUTOMATIC_CHARGE_ENDPOINT']
    end

    def api_key
      ENV['AUTOMATIC_CHARGE_DESTINY_ACCOUNT_ID']
    end

    def request(path, body)
      uri = URI.parse("#{base_url}/#{path}")

      header = {'Content-Type': 'text/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = body

      print("Calling presentism API #{uri}")
      http.request(request)
    end
  end
end
