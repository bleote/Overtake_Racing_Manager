class Driver < ApplicationRecord
  belongs_to :team
  belongs_to :car

  validates_uniqueness_of :driver_name
  validates_presence_of :driver_name
end
