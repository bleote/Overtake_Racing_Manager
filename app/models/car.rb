class Car < ApplicationRecord
  belongs_to :team
  has_many :drivers
end
