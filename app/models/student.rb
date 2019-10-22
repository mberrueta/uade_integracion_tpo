class Student < ApplicationRecord
  belongs_to :user
  belongs_to :holder
  has_and_belongs_to_many :services

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :holder, presence: true
  validates :last_name, presence: true
  validates :name, presence: true
  validates :user, presence: true, uniqueness: true
end
