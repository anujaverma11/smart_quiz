enable :sessions

get '/student_assessments' do
  if session[:student_id] == nil
    redirect '/'
  elsif session[:student_assessment_id]
    redirect "/assessments/#{sessions[:student_assessment_id]}"
  end
  p "list the assessments here"
end

get '/student_assessments/:id' do
  session[:student_assessment_id] = params[:id]
  assessment = Assessment.find_by(id: 1)
  @question_text = Question.find_by(id: 1).text
  @options = Option.where(question_id: @question.id)

  erb :quiz
end

post '/submitquiz' do
  p params

end
