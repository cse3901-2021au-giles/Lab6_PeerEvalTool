# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    instructors = User.create([{Fname: "instructor", Lname: "1", email: "instructor1@osu.edu", password: "qwerty", admin: true}])

    students = User.create([
        {Fname: "student", Lname: "1", email: "student1@osu.edu", password: "qwerty", admin: false},
        {Fname: "student", Lname: "2", email: "student2@osu.edu", password: "qwerty", admin: false},
        {Fname: "student", Lname: "3", email: "student3@osu.edu", password: "qwerty", admin: false},
        {Fname: "student", Lname: "4", email: "student4@osu.edu", password: "qwerty", admin: false}])

    courses = Course.create([{cname: "3901", user_id: 1},
                                {cname: "3902", user_id: 1},
                                {cname: "3903", user_id: 1}])