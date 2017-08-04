require "test_helper"

describe DaterProfile do

  let(:matchmaker) { Matchmaker.create(username: "Patty Stanger", password: "password") }
  let(:dater_profile) { matchmaker.dater_profiles.create(name: "Zosia Mamet",
                                                         age: 24,
                                                         zipcode: 10001,
                                                         gender: 0,
                                                         kids: 0,
                                                         interested_in_men: true,
                                                         interested_in_women: false,
                                                         interested_in_any: false)}


  it "belongs to a matchmaker" do
    matchmaker
    dater_profile
    assert_equal 1, matchmaker.dater_profiles.size
  end

  it "uses the enum properly" do
    assert_equal "female", dater_profile.gender
  end
end
