class Invoice < ApplicationRecord
  belongs_to :student
  has_many :items, autosave: true
  has_many :payments

  delegate :holder, to: :student

  validates_uniqueness_of :month,
                          scope: %i[student year],
                          message: 'Invoice already created'

  validates :discount,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1
            }
  validates :month,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 12
            },
            presence: true
  validates :student, presence: true
  validates :year,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2000
            },
            presence: true

  validate :not_payed

  def not_payed
    errors.add(:invoice, 'Invoice already payed') if payed
  end

  def subtotal
    @subtotal ||= items.sum(:price).to_f
  end

  def payed
    total <= payments.sum(:amount)
  end

  def total
    @total ||= (subtotal - subtotal * discount).to_f
  end

  def pay!(options = {})
    return { error: 'Invoice already payed' } if payed

    credit?(options) ? credit_pay!(options) : debit_pay!(options)
  end

  private

  def debit_pay!(options)
    result = Services::Payment.new
                              .charge(
                                options[:cbu] || holder.cbu,
                                total
                              )
    new_payment.transaction_id = result[:transaction_id]
    {
      payment: new_payment,
      error: result[:error]
    }
  end

  def credit_pay!(options)
    result = Services::Credit.new.charge(options.merge(
                                           amount: total,
                                           cuil: holder.cuil,
                                           description: "Hogwarts School of Witchcraft and Wizardry Invoice ##{id} $#{total}"
                                         ))
    new_payment.transaction_id = result[:transaction_id]

    {
      payment: new_payment,
      error: result[:error]
    }
  end

  def credit?(options)
    (options[:payment_method] || holder.payment_method) == 'CREDITO'
  end

  def new_payment
    @new_payment ||= Payment.new(
      invoice: self,
      date: Time.now,
      amount: total,
      payment_method: holder.payment_method
    )
  end
end
