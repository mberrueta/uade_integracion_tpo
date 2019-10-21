class Services < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :price, default: 0

      t.timestamps
    end

    create_table :student_services, id: false do |t|
      t.belongs_to :service
      t.belongs_to :student
    end
  end
end
