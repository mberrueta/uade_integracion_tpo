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

      return { transaction_id: response.body.transaction_id } if response == Net::HTTPSuccess

      r = JSON.parse(response.body)
      {
        error: "Payment API:#{r['status']} ~ #{r['error']}, #{r['message']}"
      }
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
