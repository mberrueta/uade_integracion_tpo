class Student < ApplicationRecord
  SINGLE_SCHOLARSHIP_ID = 10_001
  private_constant :SINGLE_SCHOLARSHIP_ID
  DOUBLE_SCHOLARSHIP_ID = 10_002
  private_constant :DOUBLE_SCHOLARSHIP_ID

  belongs_to :user
  belongs_to :holder
  has_many :invoices, dependent: :destroy
  has_and_belongs_to_many :services

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :holder, presence: true
  validates :last_name, presence: true
  validates :name, presence: true
  validates :user, presence: true, uniqueness: true

  before_validation :default_values
  before_destroy { |object| object.services.clear }

  def assign_services(service_ids)
    services << Service.where(id: service_ids)
  end

  def scholarship_type
    services.where(id: [SINGLE_SCHOLARSHIP_ID, DOUBLE_SCHOLARSHIP_ID])
            .pluck(:name)
            .first
  end

  private

  def default_values
    self.user = User.where(name: email).first
    self.user ||= User.create!(name: email, password: '123456')
  end
end
