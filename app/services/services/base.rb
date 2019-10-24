require 'net/http'
require 'uri'
require 'json'

module Services
  class Base

    def request(path, body)
      uri = URI.parse("#{base_url}/#{path}")

      header = {'Content-Type': 'application/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = body

      print("Calling presentism API #{uri} with body `#{body}`")
      respos = http.request(request)
      print("Response `#{respos.body}`")

      respos.body
    end
  end
end
