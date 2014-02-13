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
    redirect_to new_schools_teacher(current_school)
  end

  def edit
  	debugger
  	@school = User.includes(:courses_pools).where("user.id = ?", current_school.id)
  end
end
