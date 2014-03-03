SchoolScheduleCreator::Application.routes.draw do
  root to: "welcomes#welcome"

  post "/", to: "session#login"

  get  "/courses", to: "courses#new_and_edit",      as: :courses
  post "/courses", to: "courses#create_and_update", as: :create_and_update_courses

  get  "/teachers",              to: "teachers#new_and_edit",                         as: :teachers
  get  "/teachers/:id/calendar", to: "teachers#get_single_teacher_calendar_as_json",  as: :get_teacher_calendar      # AJAX
  post "/teachers/:id/calendar", to: "teachers#update_teacher_calendar",              as: :update_teacher_calendar   # AJAX
  get  "/teachers/calendars",    to: "teachers#get_multi_teachers_calendars_as_json", as: :get_all_teachers_calendars # AJAX
  # post "/teachers", to: "teachers#create_and_update", as: :create_and_update_teachers


  get  "/rooms",              to: "rooms#new_and_edit",               as: :rooms
  get  "/rooms/:id/calendar", to: "rooms#get_room_calendar_as_json",  as: :get_room_calendar      # AJAX
  post "/rooms/:id/calendar", to: "rooms#update_room_calendar",       as: :update_room_calendar   # AJAX
  get  "/rooms/calendar",     to: "rooms#get_rooms_calendar_as_json", as: :get_all_rooms_calendar # AJAX
  # get  "/rooms", to: "rooms#new_and_edit",      as: :rooms
  # post "/rooms/calendar", to: "rooms#create_and_update", as: :create_and_update_rooms

  get  "/school/new",    to: "schools#new",    as: :new_school
  get  "/school/edit",   to: "schools#edit",   as: :edit_school
  get  "/school",        to: "schools#show",   as: :school
  get  "/schools",       to: "schools#index",  as: :schools
  post "/school/create", to: "schools#create", as: :create_school
  post "/school/update", to: "schools#update", as: :update_school

  get "not_ready_yet", to: "welcomes#not_ready_yet"
end
