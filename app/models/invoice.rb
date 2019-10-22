class Invoice < ApplicationRecord
  belongs_to :student
  has_many :items, autosave: true

  validates_uniqueness_of :month, scope: [:student, :year], message: 'Invoice already created'

  validates :discount,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1
            }
  validates :month,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 12
            },
            presence: true
  validates :student, presence: true
  validates :year,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2000
            },
            presence: true

  def subtotal
    @subtotal ||= items.sum(:price).to_f
  end

  # def discount
  #   self[:discount].round(2)
  # end

  def total
    @total ||= (subtotal - subtotal * discount).to_f
  end
end
