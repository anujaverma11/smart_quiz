

get '/student/:id/assessment/:id' do
  @assessment = Assessment.find_by(id: params[:id])
  @assessmentquestions = AssessmentQuestion.where(assessment_id: @assessment.id)
  @questions = @assessmentquestions.map { |x| Question.find(x.question_id)}
  @option = Option.where(question_id: @questions[1].id)
  erb :quiz
end



