helpers do

  def find_current_student
    @current_student = Student.where(id: session[:id])
  end

  def find_current_assessment
    @current_assessment = Assessment.where(id: session[:assessment_id])
  end

  def find_current_student_assessment
    @current_student_assessment = StudentAssessment.where(student_id: @current_student.id, assessment_id: @current_assessment.id)
  end

  def next_assessment?
    if in_a_row? || enough_correct? || fucking_dumb?

      #robert's next method to run
    else
        next_question
      end
    end


  def answered_questions
   @answered_questions = []


   StudentAssessmentQuestion.where(student_assessment_id: @student_assessment_id)
  end

  def correct_answer?
    if
  end



  def in_a_row?
    #
  end

end
