class Question < ActiveRecord::Base
  has_many  :assessments
  has_many  :assessments, through: :assessment_questions

  has_many  :student_assessments
  has_many  :students_assessments, through:  :student_assessment_questions

  has_many :options
end
