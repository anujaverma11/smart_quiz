class CreateStudentAssessments < ActiveRecord::Migration
  def change
    create_table :student_assessments do |t|
      t.integer :student_id
      t.integer :assessment_id

      t.timestamps null: false
    end
  end
end
