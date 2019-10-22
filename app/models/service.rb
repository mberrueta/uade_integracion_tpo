class Service < ApplicationRecord
  has_and_belongs_to_many :students

  validates :name, presence: true
  validates :price,
            numericality: {
              greater_than_or_equal_to: 0
            }
end
