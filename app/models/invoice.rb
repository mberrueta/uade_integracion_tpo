class Invoice < ApplicationRecord
  belongs_to :student

  validates :discount,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1
            }
  validates :month,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1
            },
            presence: true
  validates :student, presence: true
  validates :year,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2000
            },
            presence: true
end
