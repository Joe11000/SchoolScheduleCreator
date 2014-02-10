class SessionController < ApplicationController

	def login
		school = School.find_by_name(params[:name])

		if school && school.authenticate(params[:password])
      session[:school_id] = school.id
      redirect_to school
    else
		  flash[:notice] = "Unsuccessful Log In"
		  flash[:color]  = "Error"
	    render "welcomes/welcome.html.erb"
		end
  end

  def logout
		session[:school_id] = nil
		redirect_to root_path
  end
end
