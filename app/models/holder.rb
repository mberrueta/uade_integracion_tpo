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
    return unless email
    
    self.user = User.where(name: email).first
    self.user ||= User.create!(name: email, password: '123456')
  end

  def debit_with_cbu
    return if debitable? && cbu || creditable?

    errors.add(:cbu, "can't be blank, if the payment is debit")
  end

  def debitable?
    !creditable?
  end

  def creditable?
    payment_method == 'CREDITO'
  end
end
