require 'test_helper'

class MatchmakerCreationTest < Capybara::Rails::TestCase

  test "a matchmaker can be created" do
    visit new_matchmaker_path
      fill_in "Username", with: "nicole"
      fill_in "Password", with: "password"
      click_button "Create Matchmaker's Account"

      assert page.assert_text('Welcome, nicole')
  end
end


#Capybara::Rails::TestCase
#ActionDispatch::IntegrationTest
#ActiveSupport::TestCase
