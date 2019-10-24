require 'net/http'
require 'uri'
require 'json'

module Services
  class Presentism < Base
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
      case options[:reason]
      when "Vacation"
        type = "VACACIONES"
      when "Medical day"
        type = "ENFERMEDAD"
      else
        type = "AUSENCIA"
      end

      req = {
        employeeCuit: options[:employee].cuil.remove('-'),
        absenceDays: (options[:end_date].to_date - options[:start_date].to_date).to_i,
        month: options[:start_date].to_date.month,
        type: type,
        from:  options[:start_date],
        to:  options[:end_date]
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
  end
end
