class StudentAssessmentQuestion < ActiveRecord::Base
  belongs_to :student_assessment
  belongs_to  :question
  has_one :option

end
