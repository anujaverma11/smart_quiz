class CreateOptions < ActiveRecord::Migration
  def change
    create_table  :options do |t|
      t.string  :text
      t.integer :question_id
      t.integer :counter

      t.timestamps null: false
    end
  end
end
