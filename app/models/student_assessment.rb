class StudentAssessment < ActiveRecord::Base
  belongs_to :student
  belongs_to :assessment
  has_many  :student_assessment_questions

  # has_many  :questions
  # has_many  :questions, through :student_assessment_questions

  # has_many  :options
  # has_many  :options, through :student_assessment_questions
end
