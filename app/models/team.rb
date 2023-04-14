class Team < ApplicationRecord
  belongs_to :chief
  belongs_to :car
  belongs_to :driver
end
