helpers do

  def find_current_student
    @current_student = Student.where(id: session[:student_id])
  end

  def find_current_student_assessment
    @current_student_assessment = StudentAssessment.where(id: session[:student_assessment_id])
  end

  def find_current_assessment
    @current_assessment = Assessment.where(id: @current_student_assessment.assessment_id)
  end

  def current_student_assessment_question
    @current_student_assessment_question = StudentAssessmentQuestion.where(student_assessment_id: @current_student_assessment.id)
  end

  def current_question
    @current_question = Question.where(id: @current_student_assessment_question.question_id)
  end

  def next_assessment?
    if in_a_row? || enough_correct? || fucking_dumb?

      #robert's next method to run
      else
        next_question
    end
  end


  def answered?
    @current_student_assessment_question.answered == true
  end

  def correct_answer?
    @correct_count = 0
    @incorrect_count = 0
    case
      when answered? && @current_student_assessment_question.option_id == @current_question.correct_answer_id
        @correct_count += 1
      when !answered?
        p "no answer to check"
      when answered? && @current_student_assessment_question.option_id != @current_question.correct_answer_id
        incorrect_count += 1
    end
     # if answered?
    #   @current_student_assessment_question.option_id == @current_question.correct_answer_id
    # else
    #   p "no answer to check"
  end

  def fucking_dumb?
    @current_student_assessment_question.position >= 9 #we can make this a variable later so it can be set
  end

  def enough_correct?
    if correct_count >= 5
  end

  def in_a_row?
    #
  end
end
