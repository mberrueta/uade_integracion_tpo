class MoreEmployeeData < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :employee_code, :string
    add_column :employees, :cuil, :string
    add_column :employees, :gender, :string
    add_column :employees, :birthdate, :date
  end
end
