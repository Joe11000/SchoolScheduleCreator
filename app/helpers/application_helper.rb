module ApplicationHelper
  def current_school
    @current_school ||= School.find(session[:school_id])
  end
end

module TimeHelper
  def get_js_timestamp_from_ruby_timestamp(ruby_timestamp)
    ruby_timestamp * 1000
  end

  def get_ruby_time_from_js_timestamp(js_timestamp)
    Time.at(js_timestamp / 1000)
  end

  def get_ruby_timestamp_from_js_timestamp(js_timestamp)
    js_timestamp / 1000
  end
end