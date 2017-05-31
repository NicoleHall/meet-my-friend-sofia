require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "MatchmakerCanLogout Integration Test" do
  it "logged in matchmaker can log out" do
    login_matchmaker
    assert page.assert_text('Welcome, nicole')

    click_link("Logout")
    refute page.has_content?('Welcome, nicole')
    assert_equal("/login", current_path)
  end
end
