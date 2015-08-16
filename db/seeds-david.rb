
student_array = []
assessment_array = []
type_array = ['Homework', 'Pop Quiz', 'Chapter Test', 'Exam']
subject_array = ['Math', 'English', 'Science', 'Social Studies', 'Phys ED']

30.times do
  student_array << Student.create(name: Faker::Name.name)
end

15.times do
  assessment_array << Assessment.create(subject: "#{(subject_array.shuffle[rand(5)-1]).to_s + ' - ' +Faker::Hacker.ingverb}", due_date: Date.today)
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
