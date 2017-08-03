class DaterProfile < ApplicationRecord
  belongs_to :matchmaker
  enum gender: [:female, :male, :not_sure, :prefer_not_to_disclose]
end
