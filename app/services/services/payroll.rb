require 'net/http'
require 'uri'
require 'json'

module Services
  class Payroll < Base
    # rubocop:disable Metrics/AbcSize
    def call
      response = post("liquidaciones/#{api_key}")
      if response.code == '200'
        JSON.parse(response.body)
      else
        {
          error: "Credit payment API: #{response.code} ~ #{response.body}"
        }
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def base_url
      ENV['CREDIT_API']
    end

    def api_key
      ENV['CREDIT_KEY']
    end
  end
end
