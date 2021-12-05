# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#Student.create(name: 'Mallory Sharp', email: 'mesharp01@hotmail.com', password: '123456')

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
