class AddPaymentType < ActiveRecord::Migration[6.0]
  def change
    add_column :holders, :payment_method, :string, default: 'DEBITO_AUTOMATICO'
    add_column :holders, :cuil, :string, default: '00000000000'
    add_column :holders, :cbu, :string
    add_column :holders, :ccard_number, :string
    add_column :holders, :cvv, :string
    add_column :holders, :expiration_date, :string
    add_column :payments, :transaction_id, :string
  end
end
