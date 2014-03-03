class TeachersController < ApplicationController
  layout "new_teachers_layout"

  def new_and_edit

    if current_school.teachers.count == 0
      @teachers_arr = ["Controller, Mary", "Controller, Tom"]
      @next_or_update = "next"
      @school = current_school
    else
      @teachers_arr = current_school.teachers
      # @next_or_update = "update"
      # @school = School.joins(:teachers).where("schools.id = ?", current_school.id).first
    end

  end

    json = {
      "Gettis, F" => { "courses" =>   { "hockey_101" => { "course_number"=> "hockey_101", "subject"=> "Intro To Hockey", "start_time"=> "", "end_time"=> ""} }, "break_times"=> {} },
      "Smith, G"=> { "courses"=> { "PHI_101"=> { "course_number"=> "MNG_101", "subject"=> "Management Philosophy", "start_time"=> "", "end_time"=> ""} }, "break_times"=> {} }
    }

  def get_single_teacher_calendar_as_json
    if not current_school
      redirect_to root and return
    end


    json = { "teachers_list" => ["Gettis, F", "Smith, G"], "Gettis, F" => { "courses" =>   { "hockey_101" => { "course_number"=> "hockey_101", "subject"=> "Intro To Hockey", "start_time"=> "", "end_time"=> ""} }, "break_times"=> {} }, "Smith, G"=> { "courses"=> { "PHI_101"=> { "course_number"=> "MNG_101", "subject"=> "Management Philosophy", "start_time"=> "", "end_time"=> ""} }, "break_times"=> {} } }
    debugger
    render json: json and return
  end

  def update_teacher_calendar
  end

  def get_multi_teachers_calendars_as_json
    debugger
    debugger
    render json: json and return

    #{
    #   'events': [
    #              { 'id'=> 1, 'start'=> (new Date(year, month, day, 11, 14)), 'end' => (new Date(year, month, day, 11, 34)),     'title' => 'Lunch With Grandma'},
    #              { 'id'=> 2, 'start'=> (new Date(year, month, day, 14)),     'end' => (new Date(year, month, day, 14, 45)),     'title' => 'Latin Class'},
    #              { 'id'=> 3, 'start'=> (new Date(year, month, day + 1, 18)), 'end' => (new Date(year, month, day + 1, 18, 45)), 'title' => 'Resus'},
    #              { 'id'=> 4, 'start'=> (new Date(year, month, day - 1, 8)),  'end' => (new Date(year, month, day - 1, 9, 30)),  'title' => 'Church TIme'},
    #              { 'id'=> 5, 'start'=> (new Date(year, month, day + 1, 14)), 'end' => (new Date(year, month, day + 1, 16)),     'title' => 'Dodgeball'},
    #              { 'id'=> 6, 'start'=> (new Date(year, month, day + 1, 15)), 'end' => (new Date(year, month, day + 1, 17)),     'title' => 'Hide in basement and hope no one sees you'}
    #            ]
    # }
  end







  def create_and_update
    # respond_to do |format|
    #   # format.html {render :new_and_edit and return}

    #   format.js do
    #     render json: { navigate: "document.location = '/teachers'" }
    #     return
    #   end
    # end

    # params[:courses].values.each do |course| # make sure teachers are saved in the correct format
    #   correct_format = course["course_number"].gsub(/[, ]/, "_")
    #   if correct_format != course["course_number"]
    #     course["course_number"] = correct_format
    #   end
    # end
    # debugger
    if current_school.teachers.count == 0 # schools first school creation
      # debugger
      params[:teachers].values.each do |teacher|
        current_school.teachers.create(teacher)
      end
      render json: { navigate: "document.location = '/teachers'" } and return
    else
      # debugger
      if not params[:teachers]  # if updated courses to remove them all
      # debugger
        current_school.teachers.destroy_all
        render json: { notice: "At least one teacher is required.", color: "Error" }  and return
      else
      # debugger
        current_school.deleteNoLongerNeededCourses(params[:teachers])

        params[:teachers].values.each do |teacher|
          find_teacher = current_school.teachers.find_by_name(teacher[:course_number])

          if find_teacher  # course_number
      # debugger
            find_teacher.update_attributes(teacher)
          else
      # debugger
            current_school.teachers.create(teacher)
          end
        end
      end
      # debugger
      render json: { navigate: "document.location = '/school'" } and return
    end
  end


=begin
  Teacher.find(id: params[:id]).break_times + Teacher.find(id: params[:id]).courses_teaching
  or
  Teacher.includes(:break_times, :courses_teaching).where("schools.id = :school_id AND teachers.id = teachers_id",
                                                           {school_id: current_school, teacher_id: params[:id]})
=end




  def show
    # debugger
    # debugger
  end
end
