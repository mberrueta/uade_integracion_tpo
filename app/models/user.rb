class User < ApplicationRecord
  has_secure_password
  has_one :student
  has_one :holder
  has_one :admin_user
  has_one :employee

  validates :name, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def roles
    @roles = []
    @roles << :student if student
    @roles << :holder if holder
    @roles << :admin_user if admin_user
    @roles << :employee if employee
    @roles
  end
end
