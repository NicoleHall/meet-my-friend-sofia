ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'capybara/rails'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def teardown
    reset_session!
  end

  def login_matchmaker
    @matchmaker = Matchmaker.create(username: "nicole", password: "password")
    visit login_path
    fill_in "Username", with: @matchmaker.username
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
