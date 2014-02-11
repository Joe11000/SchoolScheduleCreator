module ApplicationHelper
  def current_school
    @current_school ||= School.find(session[:school_id])
  end
end
