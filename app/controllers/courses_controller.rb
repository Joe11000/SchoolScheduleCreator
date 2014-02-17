class CoursesController < ApplicationController
  layout "new_courses_layout"

  def new_and_edit
    debugger
    # debugger

    if current_school.courses_pools.count == 0
      @next_or_update = "next"
      @school = current_school
    else
      @next_or_update = "update"
      @school = School.joins(:courses_pools).where("schools.id = ?", current_school.id).first
    end
  end

  def create_and_update

    respond_to do |format|
      # format.html {render :new_and_edit and return}
      format.js   { render js: "alert('it worked!');" and return}
    end

    if request.xhr?
      debugger
    end


    # debugger
    debugger
    params[:courses].values.each do |course| # make sure course_numbers are saved in the correct format
    # debugger
      correct_format = course["course_number"].gsub(/[, ]/, "")
    # debugger
      if correct_format != course["course_number"]
    # debugger
        course["course_number"] = correct_format
      end
    end

    debugger
    if current_school.courses_pools.count == 0 # schools first school creation
      params[:courses].values.each do |course|
        debugger
        current_school.courses_pools.create(course)
        debugger
      end
      redirect_to teachers_path and return
    else
    debugger
      if not params[:courses]       # if updated courses to remove them all
       debugger
       debugger
        current_school.courses_pools.destroy_all
        flash[:notice] = "At least one course required."
        flash[:color]  = "Error"
        redirect_to courses_path and return
      else
                                     # school updating courses
      params[:courses].values.each do |course|
        c = current_school.courses_pools.find_by_course_number(course[:course_number])
        debugger

        if c  # course_number
          debugger
          c.update_attributes(course)
        else
          debugger
          current_school.courses_pools.create(course)
        end
      end

      redirect_to school_path and return
    end
  end

  def show
    debugger
    debugger
  end

  end
end
