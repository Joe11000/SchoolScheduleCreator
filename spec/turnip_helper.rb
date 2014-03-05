$: << File.dirname(__FILE__) + '/../../../lib'

require 'turnip/capybara'
require 'capybara/poltergeist'
require 'rspec_junit_formatter'
require 'ostruct'
require 'builder'
require 'httparty'
require 'date'


require 'support/monkeypatch_mavericks'
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => false, :timeout => 60, phantomjs_logger: WarningSuppressor, :inspector => true)
end

# Use webkit for everything.
Capybara.default_driver = :poltergeist

# These tests are not embedded within a Rack application, they are
# remote tests of a set of apps (splat, security services, rubycas, ...).
Capybara.run_server = false

Capybara.default_wait_time = 20
Capybara.save_and_open_page_path = File.join('tmp','screenshots')

RSpec.configure do |cfg|
  cfg.include Capybara::DSL

  cfg.treat_symbols_as_metadata_keys_with_true_values = true

  # cfg.before :each, :global do
  #   ::Capybara.reset_session!
  # end

  # cfg.fail_fast = true
  Dir.glob("spec/features/steps/*steps.rb") { |f| load f, true }
end

require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
Capybara::Screenshot.append_screenshot_path = false

# Register filename prefix formatters
Capybara::Screenshot.class_eval do
  register_filename_prefix_formatter(:rspec) do |example|
    dirs = []
    example.example_group.metadata[:example_group].container_stack.reverse.each do |a|
      dirs << a[:description_args].join('_')
    end

    dirs = dirs.map { |d| d.gsub(/\W/, '_').gsub(/_+/, '_') }

    path = File.join(*dirs) + '/'
    FileUtils.mkdir_p(File.join(Capybara.save_and_open_page_path, path))

    path
  end
end
