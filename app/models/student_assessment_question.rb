class StudentAssessmentQuestion < ActiveRecord::Base
  belongs_to :student_assessment
  belongs_to  :question
  belongs_to  :option
end
