# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#Student.create(name: 'Mallory Sharp', email: 'mesharp01@hotmail.com', password: '123456')

=begin
10.times do |s|
  name = "Student" + s.to_s
  email = name+'@osu.edu'
  password = 'qwerty'
  Student.create(name: name, email: email, password: password, password_confirmation: password)
end

10.times do |i|
  name = "Instructor" + i.to_s
  email = name+'@osu.edu'
  password = 'qwerty'
  Instructor.create(name: name, email: email, password: password, password_confirmation: password)
end

10.times do |t|
  name = "Team" + t.to_s
  Team.create(name: name)
end
=end

10.times do |i|
  name = "Instructor" + i.to_s
  email = name+'@osu.edu'
  password = 'qwerty'
  Instructor.create(name: name, email: email, password: password, password_confirmation: password)
end

name = "Team 1"
t1 = Team.create(name: name)

name = "Team 2"
t2 = Team.create(name: name)

name = "Student 1"
email = 'student1@osu.edu'
password = 'qwerty'
s1 = Student.create(name: name, email: email, password: password, password_confirmation: password)

name = "Student 2"
email = 'student2@osu.edu'
password = 'qwerty'
s2 = Student.create(name: name, email: email, password: password, password_confirmation: password)

name = "Student 3"
email = 'student3@osu.edu'
password = 'qwerty'
s3 = Student.create(name: name, email: email, password: password, password_confirmation: password)

name = "Student 4"
email = 'student4@osu.edu'
password = 'qwerty'
s4 = Student.create(name: name, email: email, password: password, password_confirmation: password)

name = "Student 5"
email = 'student5@osu.edu'
password = 'qwerty'
s5 = Student.create(name: name, email: email, password: password, password_confirmation: password)

name = "Student 6"
email = 'student6@osu.edu'
password = 'qwerty'
s6 = Student.create(name: name, email: email, password: password, password_confirmation: password)


t1.students << s1
t1.students << s2
t1.students << s3

t2.students << s3
t2.students << s4
t2.students << s5

