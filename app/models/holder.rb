class Holder < ApplicationRecord
  belongs_to :user

  validate :debit_with_cbu
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, presence: true
  validates :name, presence: true
  validates :user, presence: true, uniqueness: true

  before_validation :default_values

  private

  def default_values
    if email
      self.user = User.where(name: email).first
      self.user ||= User.create!(name: email, password: '123456')
    end
  end

  def debit_with_cbu
    return if is_automatic_debitable? && cbu
    errors.add(:cbu, "can't be blank, if the payment is debit")
  end

  def is_automatic_debitable?
    payment_method == 'DEBITO_AUTOMATICO'
  end
end
