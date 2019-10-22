class Payment < ApplicationRecord
  belongs_to :invoice

  validates :amount, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :invoice, presence: true
  validates :payment_method, presence: true

  before_save :default_values

  private

  def default_values
    self.date ||= Time.now
  end
end
