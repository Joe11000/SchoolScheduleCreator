module ApplicationHelper
  def current_school
    School.find_by_id(session[:school_id])
  end
end
