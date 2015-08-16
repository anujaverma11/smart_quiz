Assessment.create(id: 1, assestype: "Math Homework-Addition", subject: "Math", due_date: "08/16/2015", source: "Chapter 1", parent_id: 1);
  Assessment.create(id: 2, assestype: "Math Homework-Subtraction", subject: "Math", due_date: "08/16/2015", source: "Chapter 1", parent_id: 1);
  Assessment.create(id: 3, assestype: "Math Homework-Multiplication", subject: "Math", due_date: "08/16/2015", source: "Chapter 1", parent_id: 1);
  Assessment.create(id: 4, assestype: "Math Homework-Division", subject: "Math", due_date: "08/16/2015", source: "Chapter 1", parent_id: 1);


  Question.create(id: 1, text:'What is 2 + 2 ?', correct_answer_id: 3, counter: 0);
  Question.create(id: 2, text:'What is 6 + 1 ?', correct_answer_id: 3, counter: 0);
  Question.create(id: 3, text:'What is 212 + (-4) ?', correct_answer_id: 3, counter: 0);
  Question.create(id: 4, text:'What is (-14) + 3 ?', correct_answer_id: 3, counter: 0);


Option.create(id: 1, text:'6', question_id: 1, counter: 0);
Option.create(id: 2, text:'2.5', question_id: 1, counter: 0);
Option.create(id: 3, text:'4', question_id: 1, counter: 0);
Option.create(id: 4, text:'-4', question_id: 1, counter: 0);

Assessquestion.create(assessment_id:1,question_id:1);
Assessquestion.create(assessment_id:1,question_id:2);
Assessquestion.create(assessment_id:1,question_id:3);
Assessquestion.create(assessment_id:1,question_id:4);
