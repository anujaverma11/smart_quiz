Student.create(name: "Bob") #id 1
Student.create(name: "Joe") #id 2

StudentAssessment.create(student_id: 1, assessment_id: 1) #id 1 (for student 1)
StudentAssessment.create(student_id: 2, assessment_id: 1) #id 1 (for student 2)
StudentAssessment.create(student_id: 3, assessment_id: 1)
StudentAssessment.create(student_id: 3, assessment_id: 2)

Assessment.create(subject: "Math") #id 1
Assessment.create(subject: "Math II", due_date: "08/17/2015", source: "Chapter 1");

Question.create(text: "What is 2+2 ?", correct_answer_id: 4, counter: 0) #id 1
Question.create(text: "What is 3+3 ?", correct_answer_id: 8, counter: 0) #id 2

AssessmentQuestion.create(assessment_id: 1, question_id: 1)
AssessmentQuestion.create(assessment_id: 1, question_id: 2)

Option.create(text: "1", question_id: 1, counter: 0) #id 1
Option.create(text: "2", question_id: 1, counter: 0) #id 2
Option.create(text: "3", question_id: 1, counter: 0) #id 3
Option.create(text: "4", question_id: 1, counter: 0) #id 4 correct

Option.create(text: "3", question_id: 2, counter: 0) #id 5
Option.create(text: "4", question_id: 2, counter: 0) #id 6
Option.create(text: "5", question_id: 2, counter: 0) #id 7
Option.create(text: "6", question_id: 2, counter: 0) #id 8 correct

StudentAssessmentQuestion.create(student_assessment_id: 1, question_id: 1, option_id: 4)
StudentAssessmentQuestion.create(student_assessment_id: 1, question_id: 1, option_id: 8)





