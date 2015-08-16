enable :sessions

get '/student_assessments' do
  if session[:student_id] == nil
    redirect '/'
  elsif session[:student_assessment_id]
    redirect "/assessments/#{sessions[:student_assessment_id]}"
  end
  p "list the assessments here"
end


get '/student_assessments/:student_assessment_id' do
  session[:student_assessment_id] = params[:student_assessment_id]
  @assessment = Assessment.find(params[:student_assessment_id])
  erb :quiz_layout
end


get '/student_assessments/:student_assessment_id/student_assessment_questions' do
  all_questions = StudentAssesmentQuestion.where(student_assessment_id: params[:student_assessment_id])
  @questions_to_display = all_questions.where.not(position: nil).order(:position)
  if @questions_to_display.last.answered && !next_assessment?
    @questions_to_display << (all_questions - @questions_to_display).shuffle.pop
    @questions_to_display.last.position = @questions_to_display.length
  elsif next_assessment?
    # indicate that the quiz is complete
  end

  erb :quiz
end


get '/student_assessments/:student_assessment_id/student_assessment_questions/:id' do
  #set active question
  active_question = StudentAssesmentQuestion.find(params[:question_id])

  #set question text
  @question_text = active_question.text
  @options = Option.where(question_id: active_question.question_id)
  # shows proper erb based on w/n question is answered

  if active_question.answered
    @option_text = Option.find(active_question.option).text
    erb :"partials/_answered_question"
  else
    erb :"partials/_question"
  end
end


post '/student_assessments/:student_assessment_id/student_assessment_questions/:question_id/options/:option_id' do
  #set active question and assessment
  active_question = StudentAssesmentQuestion.find(params[:question_id])
  active_assessment = StudentAssessment.find(active_question.student_assessment_id)

  #verify session
  redirect '/' unless active_assessment.student_id == session[:student_id]

  #set the answer selected by the student
  active_question.update(option: params[:option_id])

  #update relevant counters
  Question.find(active_question.question_id).increment_counter
  Option.find(params[:option_id]).increment_counter

  # set the question to 'answered' so that it will remain in place
  active_question.answer

  #redirect to get route for same question
  redirect "/student_assessments/:student_assessment_id/student_assessment_questions/#{params[:question_id]}"
end
