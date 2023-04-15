class Race < ApplicationRecord
  belongs_to :user
  belongs_to :circuit
  has_many :teams
end
