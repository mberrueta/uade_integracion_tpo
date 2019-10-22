class MoreStudentsData < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :scholarship_type, :string
  end
end
