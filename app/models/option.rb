class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :student_assessment_questions
end
