# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Student.delete_all
Student.create(id: 1, student_id: SecureRandom.uuid, first_name: "oleg", last_name: "goushcha", gender: "male", date_of_birth: "1985-02-17")
Student.create(id: 2, student_id: SecureRandom.uuid, first_name: "ilja", last_name: "goushcha", gender: "male", date_of_birth: "1982-05-25")
Student.create(id: 3, student_id: SecureRandom.uuid, first_name: "kate", last_name: "spears", gender: "female", date_of_birth: "1988-03-20")
Student.create(id: 4, student_id: SecureRandom.uuid, first_name: "john", last_name: "smith", gender: "male", date_of_birth: "1991-10-03")

Course.delete_all
Course.create(name: "math", number: "001", section: "a")
Course.create(name: "calculus", number: "001", section: "a")
Course.create(name: "programming", number: "002", section: "a")

Enrollment.delete_all
Enrollment.create(course_id: 1, student_id: 1)
Enrollment.create(course_id: 1, student_id: 3)
Enrollment.create(course_id: 2, student_id: 1)
Enrollment.create(course_id: 2, student_id: 2)
Enrollment.create(course_id: 2, student_id: 4)