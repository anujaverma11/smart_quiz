class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :student_assessment_questions

  def increment_counter
    self.counter += 1
    self.save
  end
end
