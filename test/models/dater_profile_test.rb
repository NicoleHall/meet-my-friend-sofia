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
