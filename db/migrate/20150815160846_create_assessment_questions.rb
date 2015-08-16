class CreateAssessmentQuestions < ActiveRecord::Migration
  def change
    create_table  :assessment_questions do |t|
      t.integer :assessment_id
      t.integer :question_id
      t.boolean :answered
      t.integer :position

      t.timestamps null: false
    end
  end
end
