class LapTime < ApplicationRecord
  belongs_to :race
  belongs_to :driver

  default_scope { order(:lap_time) }
end
