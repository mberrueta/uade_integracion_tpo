require 'net/http'
require 'uri'
require 'json'

module Services
  class Base
    
    def post(path, body)
      request(path, body, :post)
    end

    def request(path, body, type)
      uri = URI.parse("#{base_url}/#{path}")

      header = {'Content-Type': 'application/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      if type == :post
        request = Net::HTTP::Post.new(uri.request_uri, header)
      else
        request = Net::HTTP::Get.new(uri.request_uri, header)
      end
      request.body = body

      Rails.logger.info(">>>>> Calling external #{uri} with body `#{body}`")
      respos = http.request(request)
      Rails.logger.info("Response `#{respos.body}`")

      respos
    end
  end
end
