class Matchmaker < ApplicationRecord
  has_secure_password
  has_many :dater_profiles
end
