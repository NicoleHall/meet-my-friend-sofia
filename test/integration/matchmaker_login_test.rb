require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "MatchmakerLogin Integration Test" do
  it "matchmaker can login" do
    login_matchmaker
    assert page.assert_text('Welcome, nicole')
  end

  it "matchmaker is prompted to create an account if user doesn't exist" do
  end

  it "matchmaker is prompted to re-enter password if password is incorrect " do
  end

  it "matchmaker can change password if forgotten " do
  end


end
