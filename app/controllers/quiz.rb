

get '/quiz' do
  @assessment = Assessment.find_by(id: 1)
  @question = Question.find_by(id: 1)
  @option = Option.where(question_id: @question.id)
  erb :quiz

end

post '/submitquiz' do
  p params

end
