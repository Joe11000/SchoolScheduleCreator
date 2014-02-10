class SchoolsController < ApplicationController
	def new
		debugger
		@school = School.new
		debugger
		''
  end

	def show
		@school = current_school
	end

	def create
		if params[:password] != params[:password_confirmation]
		  debugger
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

    elsif not School.find_by_name(params[:name])
    	debugger
    	new_school = School.new(params[:school])
    	debugger
    	# new_school.password = params[:password]
		  redirect_to new_school_course(current_school)

		else
    	debugger
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			@school_name_user_choose = params[:name]
			# @password_user_choose = params[:password]
			redirect_to new_school_course(current_school)
		end
	end

	# def destroy
	# end

	# def index
	# end


	# def update
	# end
end