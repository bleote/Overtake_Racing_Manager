class Race < ApplicationRecord
  belongs_to :user
  belongs_to :circuit
  belongs_to :team
end
