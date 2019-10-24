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
        businessId: api_key,
        customerId: options[:cuil],
        price: options[:amount],
        cardNumber: options[:card_number],
        expirationDate: options[:expiration_date],
        securityCode: options[:cvv],
        payments: options[:payments],
        description: options[:description]
      }

      response = post('create', req.to_json)
      if response.code == '200'
        r = JSON.parse(response.body)
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
