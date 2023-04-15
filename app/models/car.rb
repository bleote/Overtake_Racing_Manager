class Car < ApplicationRecord
  belongs_to :team
  has_one :driver
end
