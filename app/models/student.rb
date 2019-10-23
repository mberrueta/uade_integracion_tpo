class Student < ApplicationRecord
  belongs_to :user
  belongs_to :holder
  has_and_belongs_to_many :services

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :holder, presence: true
  validates :last_name, presence: true
  validates :name, presence: true
  validates :user, presence: true, uniqueness: true

  before_validation :default_values

  def assign_services(service_ids)
    services << Service.where(id: service_ids)
  end

  private

  def default_values
    self.user = User.where(name: email).first
    self.user ||= User.create!(name: email, password: '123456')
  end
end
