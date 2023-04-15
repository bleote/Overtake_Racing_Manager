class Team < ApplicationRecord
  has_one :chief
  has_many :cars
  has_many :drivers
  has_many :races
end
