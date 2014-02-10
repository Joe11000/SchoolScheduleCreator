class SchoolsController < ApplicationController
	def new
		@school = School.new
  end

	def show
		@school = current_school
	end

	def create
		debugger
		if params[:password] != params[:password_confirmation]
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

    if not School.find_by_name(params[:name])
    	new_school = User.new(name: params[:name],

    	new_school.password = params[:password], password_confirmation: params[:password_confirmation])
		  redirect_to new_school_course(current_school)
		elsif
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			@school_name_user_choose = params[:name]
			# @password_user_choose = params[:password]
			redirect_to
		end

	end

	# def destroy
	# end

	# def index
	# end


	# def update
	# end
end