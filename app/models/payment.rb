class Payment < ApplicationRecord
  belongs_to :invoice

  validates :amount, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :invoice, presence: true
  validate :over_payments

  before_validation :default_values

  private

  def default_values
    self.date ||= Time.now
    self.payment_method = 'efectivo' unless payment_method.present?
  end

  # rubocop:disable Metrics/LineLength
  # rubocop:disable Metrics/AbcSize
  def over_payments
    return unless invoice
    return unless invoice.total < other_similar_payments.sum(:amount) + amount

    if amount > invoice.total
      errors.add(:over_payed, "can't create a payment. Amount should be less than #{invoice.total}")
    else
      left_pay = invoice.total - other_similar_payments.sum(:amount)
      errors.add(:over_payed, "can't create a payment. there are already #{other_similar_payments.count} payments. It left only $ #{left_pay} to pay")
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/LineLength

  def other_similar_payments
    @other_similar_payments ||= Payment.where(invoice_id: invoice_id)
  end
end
