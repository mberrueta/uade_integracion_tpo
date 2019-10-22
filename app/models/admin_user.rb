class AdminUser < ApplicationRecord
  belongs_to :user, autosave: true

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user, presence: true, uniqueness: true

  before_validation :default_values

  private

  def default_values
    self.user = User.where(name: email).first
    self.user ||= User.create!(name: email, password: '123456')
  end
end
