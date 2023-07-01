class Team < ApplicationRecord
  has_one :chief
  has_many :cars
  has_many :drivers
  has_many :races
  has_many :users

  validates_uniqueness_of :name
  validates_presence_of :name
end
