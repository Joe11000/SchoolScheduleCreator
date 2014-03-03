class SchoolsController < ApplicationController
	def edit
    @school = current_school
  end

  def new
  	session[:school_id] = nil if session[:school_id]

    @school = School.new
  end

	def show
		@school = current_school
	end

	def create
		new_school = School.new(params[:school])

		if params[:password] != params[:password_confirmation] # error passwords not same
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to courses_path

    elsif School.find_by_name(params[:name])  # error school exists already
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to courses

		else
    	new_school.password = params[:school][:password]
    	new_school.password_confirmation = params[:school][:password_confirmation]
    	new_school.save
    	session[:school_id] = new_school.id

		  redirect_to courses_path
		end
	end

	def update
    s = School.find_by_name(params[:name])

		if params[:password] == "" || params[:password_confirmation] == "" # No password entered
			@school = School.new(params[:school])

			flash[:notice] =  "Must enter password AND password confirmation"
			flash[:color]  = "Error"
			redirect_to edit_school_course(current_school)

		elsif params[:password] != params[:password_confirmation] # error passwords not same
			flash[:notice] = "Please Re-enter Password"
			flash[:color]  = "Error"
			redirect_to new_course_path

		elsif s && s.id != current_school.id  # if another school has the name already
			@school = School.new(params[:school])

			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to edit_course_path

		else
			current_school.update_attributes(params[:school])
    	current_school.password = params[:school][:password]
    	current_school.password_confirmation = params[:school][:password_confirmation]
    	current_school.save
		  redirect_to school_path
		end
	end
end