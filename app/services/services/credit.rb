require 'net/http'
require 'uri'
require 'json'

module Services
  class Credit
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

    def request(path, body)
      uri = URI.parse("#{base_url}/#{path}")

      header = {'Content-Type': 'application/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = body

      print("Calling credit API #{uri} with body `#{body}`")
      respos = http.request(request)
      print("Response `#{respos.body}`")

      case respos
      when Net::HTTPSuccess, Net::HTTPRedirection
        true
      else
        print(respos.value)
        false
      end
    end
  end
end