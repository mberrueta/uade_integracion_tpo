require 'net/http'
require 'uri'
require 'json'

module Services
  class Base
    def post(path, body = {})
      uri = URI.parse("#{base_url}/#{path}")
      Rails.logger.info(">>>>> Calling external #{uri} - body `#{body}`")
      r = Net::HTTP::Post.new(uri.request_uri, header)
      r.body = body
      respos = http(uri).request(r)
      Rails.logger.info("Response `#{respos.body}`")
      respos
    end

    def get(path)
      uri = URI.parse("#{base_url}/#{path}")
      Rails.logger.info(">>>>> Calling external #{uri}")
      r = Net::HTTP::Get.new(uri.request_uri, header)
      respos = http(uri).request(r)
      Rails.logger.info("Response `#{respos.body}`")
      respos
    end

    def header
      { 'Content-Type': 'application/json' }
    end

    def http(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end
    # rubocop:enable Metrics/AbcSize
  end
end
