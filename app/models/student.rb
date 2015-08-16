class Student < ActiveRecord::Base
  has_many :assessments
  has_many :assessments, through: :student_assessments
end
