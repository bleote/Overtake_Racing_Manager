class Driver < ApplicationRecord
  belongs_to :team
  belongs_to :car

  validates_uniqueness_of :name
  validates_presence_of :name
end
