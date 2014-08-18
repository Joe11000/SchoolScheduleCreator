school = School.new(name: "School_A",
	                  location: "43.5253 1253.5362",
	                  bio: "Seeds...This is the Bio")
school.password = "1234";
school.password_confirmation = "1234"
school.save

school.open_times.create(start_time: Time.new(2013,12,15,6,30),
                           end_time: Time.new(2013,12,15,7,30))

teacher = school.teachers.create(name: "Teacher_A",
	                               bio: "Seeds...I do teacherly things")


teacher.break_times.create(start_time: Time.new(2013,12,31,6,30),
	                         end_time: Time.new(2013,12,31,7,30))


cp1 = school.courses_pools.create(subject:    "english",
	                                course_code: "ENG_102",
	                                min_students_to_teach: 15)
cp2 = school.courses_pools.create(subject:    "math",
	                                course_code: "MAT_521",
                                  min_students_to_teach: 6)


teacher.courses_could_teach << [cp1, cp2]

room = school.rooms.create(number: '1551', capacity: 30)


# Insert Teacher_Course_Room_Possibility
