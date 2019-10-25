class Employee < ApplicationRecord
  belongs_to :user

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, presence: true
  validates :name, presence: true
  validates :user, presence: true, uniqueness: true
  validates :employee_code, presence: true
  validates :start_date, presence: true
  validates :cuil, presence: true
  validates :gender, presence: true
  validates :birthdate, presence: true

  before_validation :default_values
  before_save :register_presentism_system

  private

  def default_values
    self.user = User.where(name: email).first
    self.user ||= User.create!(name: email, password: '123456')
    self.start_date ||= Time.now
  end

  # Employee.all.each { |e| e.send(:register_presentism_system) }
  def register_presentism_system
    Services::Presentism.new.register(self)
  end
end
