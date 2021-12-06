# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

name = "Instructor 1"
email = 'instructor1@osu.edu'
password = 'qwerty'
i1 = Instructor.create(name: name, email: email, password: password, password_confirmation: password)

name = "Instructor 2"
email = 'instructor2@osu.edu'
password = 'qwerty'
i2 = Instructor.create(name: name, email: email, password: password, password_confirmation: password)


c1 = Course.create(name: "Course 1", instructor_id: i1.id)
c2 = Course.create(name: "Course 2", instructor_id: i2.id)

t1 = Team.create(name: "Team 1", instructor_id: i1.id, course_id: c1.id)
t2 = Team.create(name: "Team 2", instructor_id: i2.id, course_id: c2.id)

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

