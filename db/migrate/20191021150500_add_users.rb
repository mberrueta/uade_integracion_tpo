class AddUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :digest, null: false

      t.timestamps
    end
  end
end
