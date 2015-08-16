class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :given_name
      t.string :family_name
      t.string  :token
      t.integer :expires
      t.string :picture
      t.string  :jwt

      t.timestamps null: false
    end
  end
end
