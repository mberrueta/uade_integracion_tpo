class Invoices < ActiveRecord::Migration[6.0]
  # rubocop:disable Metrics/AbcSize
  def change
    create_table :invoices do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.integer :year, null: false
      t.integer :month, null: false
      t.decimal :discount, default: 0

      t.timestamps
    end

    create_table :items do |t|
      t.belongs_to :invoice, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true
      t.decimal :price, default: 0

      t.timestamps
    end

    create_table :paymnents do |t|
      t.belongs_to :invoice, null: false, foreign_key: true
      t.datetime :date, null: false
      t.decimal :amount, default: 0
      t.string :payment_method, default: ''

      t.timestamps
    end
  end
  # rubocop:enable Metrics/AbcSize
end
