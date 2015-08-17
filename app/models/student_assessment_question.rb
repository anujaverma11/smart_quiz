class StudentAssessmentQuestion < ActiveRecord::Base
  belongs_to :student_assessment
  belongs_to  :question
  has_one :option

  def answer
    self.answered = true
    self.save
  end

  def correct?
    self.option_id == Question.find_by(id: self.question_id).correct_answer_id
  end
###################################







  def next_assessment?
    if in_a_row? || enough_correct? || fucking_dumb?
      return true
    else
      return false
    end
  end

  def fucking_dumb?
    @self.position >= 9 #we can make this a variable later so it can be set
  end

  def enough_correct?
    @correct_count = 0
    @incorrect_count = 0
    each student_assessment do |object|
      if correct?
        @correct_count += 1
      else
        @incorrect_count += 1

    if correct_count >= 5
  end

  def in_a_row?
    @correct_array = []
    if correct_answer?
      @correct_array << self.position
      if correct_array.length >= 4
        @correct_array.clear
        return true
      else
        return false
    else
      @correct_array.clear
        return false
      end
    end
  end



end
