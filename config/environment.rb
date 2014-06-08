# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
GbcApp::Application.initialize!

app_environment_variables = File.join(Rails.root, 'config', 'app_environment_variables.rb')
load(app_environment_variables) if File.exists?(app_environment_variables)
