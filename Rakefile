# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SchoolScheduleCreator::Application.load_tasks


# # Not working below at the moment. Suppose to test all factories before execution of suite.
# if defined?(RSpec)
#   desc 'Run factory specs.'
#   RSpec::Core::RakeTask.new(:factory_specs) do |t|
#     t.pattern = './spec/factories_spec.rb'
#   end
# end

# task spec: :factory_specs
