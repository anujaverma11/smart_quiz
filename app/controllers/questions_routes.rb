post '/student_assessments/:student_assessment_id/student_assessment_questions/new' do
  args = { student_assessment_id: params[:student_assessment_id],
           question_id: params[:question_id],
           option_id: params[:option_id]
  }
  StudentAssessmentQuestion.create(args)
end

# get 'student_assessments/:id' do
#   #make sure the right student is logged in

# end
