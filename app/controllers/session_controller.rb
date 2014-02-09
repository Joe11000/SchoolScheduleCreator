class SessionController < ApplicationController
	def login
    # debugger
    # if current_school
    #   debugger
    # 	redirect_to root_path and return
    # end

		school = School.find_by_name(params[:name])

		if school && school.authenticate(params[:password]) && params[:password] == params[:password_confirmation]
      session[:school_id] = school.id
      redirect_to school_path(school)
    else
		  flash[:notice] = "Unsuccessful Log In"
		  flash[:color]  = "Error"
      # debugger
	    render 'welcomes/welcome.html.erb'
		end
  end


  # def logout
		# school = School.find_by_name(params[:name])

		# if school && school.authenticate(params[:password]) && params[:password] == params[:password_confirmation]
  #     # debugger
  #     session[:school_id] = school.id
  #     debugger
  #     redirect_to school_path(school)
  #     # "schools/show.html.erb"
  #   else
		#   flash[:login_error] = "Unsuccessful Log In"
	 #    redirect_to root_path
		# end
  # end
end
