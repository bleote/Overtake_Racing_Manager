class Car < ApplicationRecord
  AEROSETUP = [
    'Maximum downforce', 'Cornering', 'Balanced',
    'Straights', 'Minimum downforce'
  ]

  GEARS = [
    'Acceleration', 'Balanced', 'Top Speed'
  ]

  TYRES = [
    'Softs', 'Mediums', 'Hards', 'Intermediates', 'Wets'
  ]

  belongs_to :team
  has_many :drivers
  has_many :races, through: :team

  validates :aero_setup, inclusion: { in: AEROSETUP }
  validates :gear_ratio, inclusion: { in: GEARS }
  validates :tyres, inclusion: { in: TYRES }

  def self.reset_dnf_status
    Car.update_all(dnf: false)
  end
end
