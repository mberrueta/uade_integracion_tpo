class Holder < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :user, presence: true, uniqueness: true
end
