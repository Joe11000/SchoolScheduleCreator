class CoursesController < ApplicationController
  def add


  end

  def new

  	# debugger
  	@school = current_school
  	# debugger
  end

  def edit
  	debugger
  	@school = User.includes(:courses_pools).where("user.id = ?", current_school.id)
  end
end
