class Assessment < ActiveRecord::Base
  extend ActsAsTree::TreeWalker
    acts_as_tree order: "name"

    has_many :students
    has_many  :students, through:  :student_assessments

    has_many  :questions
    has_many  :questions, through: :assessment_questions
end
