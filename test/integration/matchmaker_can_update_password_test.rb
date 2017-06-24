require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "MatchmakerCanUpdatePassword Integration Test" do
  it "matchmaker can update password" do
    login_matchmaker
    visit edit_matchmaker_path(@matchmaker.id)
    fill_in "New password", with: "new_password"
    fill_in "New password confirmation", with: "new_password"
    click_button "Change Password"

    assert_equal matchmaker_path(@matchmaker), current_path
    page.assert_text("Thanks nicole, Your password has been updated")
  end

  it "gets an error if new password and confirm password do not match" do
    login_matchmaker
    visit edit_matchmaker_path(@matchmaker.id)
    fill_in "New password", with: "new_password"
    fill_in "New password confirmation", with: "non_matching_password"
    click_button "Change Password"

    assert_equal edit_matchmaker_path(@matchmaker.id), current_path
    save_and_open_page
    page.assert_text("New passwords did not match, please re-enter a new password")
  end
end
