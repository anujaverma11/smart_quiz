class Assessment < ActiveRecord::Base
    has_many :students
    has_many :students, through: :student_assessments
    has_many :student_assessments

    has_many :questions
    has_many :questions, through: :assessment_questions
    has_many :assessment_questions

end
