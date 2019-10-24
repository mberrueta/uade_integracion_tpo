require 'net/http'
require 'uri'
require 'json'

module Services
  class Credit < Base
    # rubocop:disable Metrics/AbcSize
    def charge(options)
      pp('>>>>>>>>>>')
      pp(options)
      pp('>>>>>>>>>>')
      req = {
        customerId: options[:cuil],
        cardNumber: options[:ccard_number],
        businessId: api_key,
        price: options[:amount],
        expirationDate: options[:expiration_date],
        securityCode: options[:cvv],
        payments: options[:payments]
      }

      response = post('create', req.to_json)
      if response == Net::HTTPSuccess
        r = JSON.parse(response)
                .map { |h| "#{h['_id']}:#{h['price']}" }
                .join(',')
        return { transaction_id: r }
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
