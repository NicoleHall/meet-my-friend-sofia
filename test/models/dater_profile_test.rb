require "test_helper"

describe DaterProfile do
  let(:dater_profile) { DaterProfile.new }

  it "belongs to a matchmaker" do
    matchmaker = Matchmaker.create(username: "Patty Stanger", password: "password")
    matchmaker.dater_profiles.create(name: "Zosia Mamet",
                                    age: 24,
                                    zipcode: 10001,
                                    gender: 0,
                                    kids: 0,
                                    interested_in_men: true,
                                    interested_in_women: false,
                                    interested_in_any: false
                                    )

    assert_equal 1, matchmaker.dater_profiles.size
  end
end



# require "test_helper"
#
# # To be handled correctly this spec must end with "Integration Test"
# describe "MatchmakerCanLogout Integration Test" do
#   it "logged in matchmaker can log out" do
#     login_matchmaker
#     assert page.assert_text('Welcome, nicole')
#
#     click_link("Logout")
#     refute page.has_content?('Welcome, nicole')
#     assert_equal("/login", current_path)
#   end
# end
