school = School.new(name: "School_A",
	                  location: "43.5253 1253.5362",
	                  bio: "Seeds...This is the Bio")
school.password = "1234";
school.password_confirmation = "1234"
school.save

teacher = Teacher.create(name: "Teacher_A",
	                       bio: "Seeds...I do teacherly things")


teacher.break_times << Timespan.create(start_time: Time.new(2013,12,31,6,30),
	                                   end_time: Time.new(2013,12,31,7,30))


cp = CoursesPool.create(subject:    "english",
	                      subject_number: 102,
	                      min_students_to_teach: 2)

teacher.courses_pools << cp


# teacher.courses_could_teach.class_time = Timespan.create(start_time: Time.new(2013,12,31,6,30),
# 	                                                     end_time:   Time.new(2013,12,31,7,30))

school.teachers << teacher
school.courses_pools << cp

school.rooms << Room.create(number: '1551', capacity: 30)

Schedule.create

