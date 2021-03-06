class Item < ApplicationRecord
  belongs_to :invoice
  belongs_to :service

  delegate :name, to: :service

  validates :invoice, presence: true
  validates :price,
            numericality: {
              greater_than_or_equal_to: 0
            }
  validates :service, presence: true

  def as_json(opt = {})
    opt.merge(methods: :name)
    super(opt)
  end
end
