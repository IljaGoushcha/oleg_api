class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
