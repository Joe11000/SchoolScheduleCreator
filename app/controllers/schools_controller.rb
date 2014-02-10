class SchoolsController < ApplicationController
	def new
		@school = School.new
  end

	def show
		@school = current_school
	end

	def create
		new_school = School.new(params[:school])

		if params[:password] != params[:password_confirmation] # error passwords not same
		  debugger
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

    elsif School.find_by_name(params[:name])  # error school exists already
    	debugger
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

		else
    	new_school.password = params[:school][:password]
    	new_school.password_confirmation = params[:school][:password_confirmation]
    	new_school.save
    	session[:school_id] = new_school.id

		  redirect_to new_school_course_path(new_school)

		end
	end

	# def destroy
	# end

	# def index
	# end


	# def update
	# end
end