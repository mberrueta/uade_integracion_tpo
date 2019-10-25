require 'net/http'
require 'uri'
require 'json'

module Services
  class Payment < Base
    def charge(cbu, amount)

      req = {
        destinoCBU: api_key,
        origenCBU: cbu,
        amount: amount
      }

      response = post('trasferir', req.to_json)
      result = JSON.parse(response.body)

      if result['success']
        {
          # TODO: should be an ID
          transaction_id: result['message']
        }
      else
        {
          error: "Payment API:#{response.code} ~ #{result['message']}"
        }
      end
    end

    private

    def base_url
      ENV['DEBIT_API']
    end

    def api_key
      ENV['DEBIT_KEY']
    end
  end
end
