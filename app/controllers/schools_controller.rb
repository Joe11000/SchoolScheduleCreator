class SchoolsController < ApplicationController
	def new
  end

	def show
		debugger
		@school = current_school
    'working???'
	 #  s = School.find_by_name(params[:name])

		# if s.is_password?(params[:password]) && params[:password] == params[:password_confirmation]
  #     @school = s
		# else

		# 	redirect_to root_path
		# end
	end

	# def create
	# end

	# def destroy
	# end

	# def index
	# end


	# def update
	# end
end