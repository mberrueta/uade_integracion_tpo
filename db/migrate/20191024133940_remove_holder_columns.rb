class RemoveHolderColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :holders, :ccard_number, :string
    remove_column :holders, :cvv, :string
    remove_column :holders, :expiration_date, :string
  end
end
