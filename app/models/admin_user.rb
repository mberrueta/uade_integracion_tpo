class AdminUser < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user, presence: true, uniqueness: true
end
