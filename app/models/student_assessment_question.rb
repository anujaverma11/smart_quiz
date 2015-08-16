class StudentAssessmentQuestion < ActiveRecord::Base
  belongs_to :student_assessment
  belongs_to  :question
  has_one :option

  def answer
    self.answered = true
    self.save
  end

  def correct?
    return nil unless self.option_id
    self.option_id == Question.find_by(id: self.question_id).correct_answer_id
  end

end
