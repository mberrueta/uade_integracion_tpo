require 'net/http'
require 'uri'
require 'json'

module Services
  class Payment < Base
    def charge(cbu, amount)
      req =  {
        cbu: cbu,
        amount: amount
      }

      response = post('xxx', req.to_json)

      return { transaction_id: response.body.transaction_id } if response == Net::HTTPSuccess

      r = JSON.parse(response.body)
      {
        error: "Payment API:#{r['status']} ~ #{r['error']}, #{r['message']}"
      }
    end

    private

    def base_url
      ENV['AUTOMATIC_CHARGE_ENDPOINT']
    end

    def api_key
      ENV['AUTOMATIC_CHARGE_DESTINY_ACCOUNT_ID']
    end
  end
end
