class DropScholarshipType < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :scholarship_type
  end
end