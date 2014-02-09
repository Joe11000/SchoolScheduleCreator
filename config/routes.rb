SchoolScheduleCreator::Application.routes.draw do

  root to: 'welcomes#not_ready_yet'
  resources :schools

  get 'not_ready_yet', to: 'welcomes#not_ready_yet'
end
