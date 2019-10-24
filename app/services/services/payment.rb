require 'net/http'
require 'uri'
require 'json'

module Services
  class Payment < Base
    def charge(cbu, amount)
      # req =  {
      #   cbu: cbu,
      # amount: amount
      # "securityCode": 366,
      # "expirationMonth": 10,
      # "expirationYear": 2029,
      # "amount": 10,
      # "cbu": 734977,
      # "detail": "Detalle de la compra (ej: Compra de TV Smart 32' )"
      # }

      req = {
        businessId: api_key,
        customerId: options[:cuil],
        cbu: options[:cbu],
        amount: options[:amount],
        cardNumber: options[:card_number],
        expirationMonth: options[:expiration_date].to_date.month,
        expirationYear: options[:expiration_date].to_date.year,
        securityCode: options[:cvv],
        description: options[:description]
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
      ENV['DEBIT_API']
    end

    def api_key
      ENV['DEBIT_KEY']
    end
  end
end
