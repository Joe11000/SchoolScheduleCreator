school = School.new(name: "School_A",
	             location: "43.5253 1253.5362",
	             bio: "Seeds...This is the Bio")
school.password = "1234";
school.password_confirmation = "1234"
school.save

teacher = Teacher.create(name: "Teacher_A",
	                       bio: "Seeds...I do teacherly things")

teacher_break = Timespan.create(start_time: Time.new(2013,12,31,6,30),
	                              end_time:   Time.new(2013,12,31,7,30))

# teacher.break_times << teacher_break


cp = CoursesPool.create(subject:    "english",
	                      start_time: DateTime.now,
	                      end_time:   DateTime.now + 1.hour,
	                      min_students_to_teach: 2)

school.teachers << teacher
school.courses_pools << cp

teacher.courses_pools << cp
