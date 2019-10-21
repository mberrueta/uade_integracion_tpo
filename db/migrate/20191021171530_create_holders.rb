class CreateHolders < ActiveRecord::Migration[6.0]
  def change
    create_table :holders do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :address
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
