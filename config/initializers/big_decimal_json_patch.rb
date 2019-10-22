require 'bigdecimal'

class BigDecimal
  def as_json(options = nil) #:nodoc:
   self.round(2).to_f
  end
end
