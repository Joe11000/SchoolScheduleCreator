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
		  # debugger
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

    elsif School.find_by_name(params[:name])  # error school exists already
    	# debugger
			@school = new_school
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)

		else
    	new_school.password = params[:school][:password]
    	new_school.password_confirmation = params[:school][:password_confirmation]
    	new_school.save
    	# debugger
    	session[:school_id] = new_school.id

		  redirect_to new_school_course_path(new_school)
		end
	end

  def edit
  	@school = current_school
  end
	# def destroy
	# end

	# def index
	# end


	def update
		debugger

		if params[:password] != params[:password_confirmation] # error passwords not same
		  # debugger
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to new_school_course(current_school)
		end

    s = School.find_by_name(params[:name])

		if s && s.id != current_school.id # if another school has the name already
    	# debugger
			@school = School.new(params[:school])
			flash[:notice] = "School Name Exists Already"
			flash[:color]  = "Error"
			redirect_to edit_school_course(current_school)

		else
			current_school.update_attributes(params[:school])
    	current_school.password = params[:school][:password]
    	current_school.password_confirmation = params[:school][:password_confirmation]
    	current_school.save

		  redirect_to course_path(current_school)
		end
	end
end