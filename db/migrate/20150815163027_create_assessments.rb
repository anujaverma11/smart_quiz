class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string  :type
      t.string  :subject
      t.date  :due_date
      t.string  :source
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
