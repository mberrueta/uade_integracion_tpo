require 'net/http'
require 'uri'
require 'json'

module Services
  class Payroll < Base
    # rubocop:disable Metrics/AbcSize
    def call
      response = get("clientes/liquidaciones-cliente/#{api_key}")
      if response.code == '200'
        JSON.parse(response.body)
      else
        {
          error: "Payroll report API: #{response.code} ~ #{response.body}"
        }
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def base_url
      ENV['PAYROLL_API']
    end

    def api_key
      ENV['PAYROLL_KEY']
    end
  end
end
