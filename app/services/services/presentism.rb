require 'net/http'
require 'uri'
require 'json'

module Services
  class Presentism
    def register(employee)
      req =  {
        cuit: employee.cuil.remove('-'),
        clientCuit: api_key,
        firstName: employee.name,
        lastName: employee.last_name
      }

      request('employee', req.to_json)
    end

    def absences(options)
      type = ["Vacation", "Medical day"].include?(options[:reason]) ? 'XXX' : 'AUSENCIA'

#       VACACIONES, ENFERMEDAD
# esos son los posibles valores, no hay AUSENCIA

      req = {
        employeeCuit: options[:employee].cuil.remove('-'),
        absenceDays: (options[:end_date].to_date - options[:start_date].to_date).to_i,
        month: options[:start_date].to_date.month,
        type: type,
      }

      request('absences', req.to_json)
    end

    private

    def base_url
      ENV['PRESENTISM_API']
    end

    def api_key
      ENV['PRESENTISM_KEY']
    end

    def request(path, body)
      uri = URI.parse("#{base_url}/#{path}")

      header = {'Content-Type': 'application/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = body

      print("Calling presentism API #{uri} with body `#{body}`")
      respos = http.request(request)
      print("Response `#{respos.body}`")

      respos.body
    end
  end
end
