require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "MatchmakerLogin Integration Test" do
  it "matchmaker can login" do
    matchmaker = Matchmaker.create(username: "nicole", password: "password")

    visit login_path
    fill_in "Username", with: matchmaker.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.assert_text('Welcome, nicole')
  end
end
