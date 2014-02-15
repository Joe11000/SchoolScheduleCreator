class CoursesController < ApplicationController
   layout "new_courses_layout"

  def new
    @school = current_school
  end

  def create
    debugger

    if current_school.courses_pools.count == 0
      params[:courses].values.each do |course|
        debugger
        caw = CoursesPool.new(course)
        debugger
        current_school.courses_pools.create(course)
        debugger
      end
    else
      params[:courses].values.each do |course|
        debugger
        c = CoursesPool.find_by_course_number(course[:course_number])

        if c
          c.update_attributes(course)
        else
          current_school.courses_pools.create(course)
        end
      end
    end

    debugger
    redirect_to new_school_teacher_path(current_school.id)
  end

  def edit
  	# debugger
  	@school = School.includes(:courses_pools).where("schools.id = ?", current_school.id)
    # debugger
    # ''
  end

  def update
    # if update set of courses doesn't contain all from School has in past. Then save and delete time
  end

  def show
  end

end
