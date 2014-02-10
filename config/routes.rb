SchoolScheduleCreator::Application.routes.draw do

  root to: 'welcomes#welcome'

  shallow do
    resources :schools  do
      resources :courses
      # resources :teachers
      # resources :rooms
    end
  end

  post '/', to: "session#login"

  get 'not_ready_yet', to: 'welcomes#not_ready_yet'
end
