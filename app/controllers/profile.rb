get "/student/:id" do
  @student = Student.find_by(id: params[:id])
  @studentassessments = StudentAssessment.where(student_id: @student.id)
  @assessments = @studentassessments.map { |x| Assessment.find(x.assessment_id) }

  erb :profile
end
