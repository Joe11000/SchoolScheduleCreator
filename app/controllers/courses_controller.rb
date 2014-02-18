class CoursesController < ApplicationController
  layout "new_courses_layout"

  def new_and_edit
    if current_school.courses_pools.count == 0
      @next_or_update = "next"
      @school = current_school
    else
      @next_or_update = "update"
      @school = School.joins(:courses_pools).where("schools.id = ?", current_school.id).first
    end
  end

  def create_and_update
    # respond_to do |format|
    #   # format.html {render :new_and_edit and return}

    #   format.js do
    #     render json: { navigate: "document.location = '/teachers'" }
    #     return
    #   end
    # end

    params[:courses].values.each do |course| # make sure course_numbers are saved in the correct format
      correct_format = course["course_number"].gsub(/[, ]/, "_")
      if correct_format != course["course_number"]
        course["course_number"] = correct_format
      end
    end

    if current_school.courses_pools.count == 0 # schools first school creation
      params[:courses].values.each do |course|
        current_school.courses_pools.create(course)
      end
      render json: { navigate: "document.location = '/teachers'" } and return
    else
      if not params[:courses]  # if updated courses to remove them all
        current_school.courses_pools.destroy_all
        render json: { notice: "At least one course required.", color: "Error" }  and return
      else
        current_school.deleteNoLongerNeededCourses(params[:courses])

        params[:courses].values.each do |course|
          find_course = current_school.courses_pools.find_by_course_number(course[:course_number])

          if find_course  # course_number
            find_course.update_attributes(course)
          else
            current_school.courses_pools.create(course)
          end
        end
      end
      render json: { navigate: "document.location = '/school'" } and return
    end
  end

  def show
    debugger
    debugger
  end
end
