ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# To get the default Rails tests to show red and green at the appropriate times

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  ActiveRecord::Migration.maintain_test_schema!
  # Add more helper methods to be used by all tests here...
end

 # Returns true if a test user is logged in.
def is_logged_in?
    !session[:user_id].nil?
end