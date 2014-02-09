SchoolScheduleCreator::Application.routes.draw do

  root to: 'welcomes#welcome'
  resources :schools

  post '/', to: "session#login"

  get 'not_ready_yet', to: 'welcomes#not_ready_yet'
end
