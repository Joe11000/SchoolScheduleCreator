class CoursesController < ApplicationController
   layout "new_courses_layout"
  def add
    debugger

  end

  def new
   # debugger
  	# debugger
  	@school = current_school
  	# debugger
  end

  def create
    debugger
    debugger
    redirect_to new_school_teacher_path(current_school.id)
  end

  def edit
  	debugger
  	@school = User.includes(:courses_pools).where("user.id = ?", current_school.id)
  end

  def update
    # if update set of courses doesn't contain all from School has in past. Then save and delete time
  end

end
