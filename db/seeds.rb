# Student.create(name: "Bob") #id 1
# Student.create(name: "Joe") #id 2

# StudentAssessment.create(student_id: 1, assessment_id: 1) #id 1 (for student 1)
# StudentAssessment.create(student_id: 2, assessment_id: 1) #id 1 (for student 2)
# StudentAssessment.create(student_id: 3, assessment_id: 1)
# StudentAssessment.create(student_id: 3, assessment_id: 2)

# Assessment.create(subject: "Math", due_date: Date.today, source: "Chapter 1") #id 1
# Assessment.create(subject: "Math II", due_date: Date.today, source: "Chapter 2");

# Question.create(text: "What is 2+2 ?", correct_answer_id: 4, counter: 0) #id 1
# Question.create(text: "What is 3+3 ?", correct_answer_id: 8, counter: 0) #id 2

# AssessmentQuestion.create(assessment_id: 1, question_id: 1)
# AssessmentQuestion.create(assessment_id: 1, question_id: 2)

# Option.create(text: "1", question_id: 1, counter: 0) #id 1
# Option.create(text: "2", question_id: 1, counter: 0) #id 2
# Option.create(text: "3", question_id: 1, counter: 0) #id 3
# Option.create(text: "4", question_id: 1, counter: 0) #id 4 correct

# Option.create(text: "3", question_id: 2, counter: 0) #id 5
# Option.create(text: "4", question_id: 2, counter: 0) #id 6
# Option.create(text: "5", question_id: 2, counter: 0) #id 7
# Option.create(text: "6", question_id: 2, counter: 0) #id 8 correct

# StudentAssessmentQuestion.create(student_assessment_id: 1, question_id: 1, option_id: 4)
# StudentAssessmentQuestion.create(student_assessment_id: 1, question_id: 1, option_id: 8)

student_array = []
assessment_array = []
type_array = ['Homework', 'Pop Quiz', 'Chapter Test', 'Exam']
subject_array = ['Math', 'English', 'Science', 'Social Studies', 'Phys ED']

15.times do
  assessment_array << Assessment.create(subject: "#{(subject_array.shuffle[rand(5)-1]).to_s + ' - ' + Faker::Hacker.ingverb}", due_date: Date.today, source: Faker::Hacker.say_something_smart)
end

assessment_array.each do |assessment_object|
  questions_array = []

  10.times do
    options_array = []

    4.times do
      options_array << Option.create(text: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}")
    end

    questions_array << Question.create(text: Faker::Lorem.sentence, correct_answer_id: options_array[rand(4)-1].id)

    options_array.each do |object|
      questions_array.last.options << object
    end
  end

  questions_array.each do |question_object|
    assessment_object.questions << question_object
  end
end




