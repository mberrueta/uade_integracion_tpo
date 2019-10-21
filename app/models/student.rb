class Student < ApplicationRecord
  belongs_to :user
  belongs_to :holder
  has_and_belongs_to_many :services

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :user, presence: true, uniqueness: true
  validates :holder, presence: true
end
