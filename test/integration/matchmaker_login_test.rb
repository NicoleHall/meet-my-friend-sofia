require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "MatchmakerLogin Integration Test" do
  it "matchmaker can login" do
    login_matchmaker

    assert page.assert_text('Welcome, nicole')
    assert_equal "/matchmakers/#{@matchmaker.id}", current_path
  end

  it "matchmaker is prompted to create an account if user doesn't exist" do
    visit login_path
    fill_in "Username", with: "Patti Stanger"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.assert_text("Patti Stanger is not a registered Matchmaker, please try again")
    assert_equal("/login", current_path)
  end

  it "matchmaker is prompted to re-enter password if password is incorrect " do
    @matchmaker = Matchmaker.create(username: "nicole", password: "password")
    visit login_path
    fill_in "Username", with: "nicole"
    fill_in "Password", with: "incorrect_password"
    click_button "Login"

    page.assert_text("incorrect password, please try again")
    assert_equal("/login", current_path)
  end




end
