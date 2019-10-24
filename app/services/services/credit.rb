require 'net/http'
require 'uri'
require 'json'

module Services
  class Credit < Base
    def charge(options)
      req =  {
        customerId : options[:cuil],
        cardNumber : options[:ccard_number],
        businessId: api_key,
        price: [numero],
        expirationDate: options[:expiration_date],
        securityCode: options[:cvv],
        payments: options[:amount]
      }

      post('create', req.to_json)
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