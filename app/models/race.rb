class Race < ApplicationRecord
  belongs_to :user
  belongs_to :circuit
  belongs_to :team
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :team_c, class_name: 'Team'
  belongs_to :team_d, class_name: 'Team'
  belongs_to :team_e, class_name: 'Team'
  belongs_to :team_f, class_name: 'Team'
  belongs_to :team_g, class_name: 'Team'
  belongs_to :team_h, class_name: 'Team'
  belongs_to :team_i, class_name: 'Team'
  belongs_to :team_j, class_name: 'Team'

  after_initialize :set_team_defaults
  after_initialize :set_weather
  after_initialize :set_status

  # race = Race.find(race_id)
  # driver = Driver.find(driver_id)
  # car = Car.find(car_id)
  # circuit = Circuit.find(circuit_id)
  # ideal_lap_time = 90 # Replace with the actual ideal lap time for the circuit
  # lap_time = race.lap_time(driver, car, circuit, ideal_lap_time)

  def lap_time(driver, car, circuit, ideal_lap_time)
    # Calculate time adjustments based on driver skills and car performance
    driver_adjustment = driver_adjustment(driver)
    car_adjustment = car_adjustment(car, circuit)

    # Add adjustments to the ideal lap time to get the final lap time
    final_lap_time = ideal_lap_time + driver_adjustment + car_adjustment
    final_lap_time
  end

  private

  def circuit_corners(circuit)
    total_corner_time = ((circuit.slow_corners * 3) + (circuit.medium_corners * 2) + (circuit.fast_corners * 1))
  end

  def circuit_straights(circuit)
    total_straight_time = ((circuit.short_straights * 3) + (circuit.medium_straights * 4) + (circuit.long_straights * 6))
  end

  def driver_adjustment(driver)
    # Adjust the lap time based on the driver's skills
    random_number_skills = rand(0.0..0.200)
    driving_skills_adjustment = (11 - driver.driving_skills) * random_number_skills
    random_number_fitness = rand(0.0..0.100)
    fitness_level_adjustment = (11 - driver.fitness_level) * random_number_fitness
    if self.weather == 'Rainny'
      wet_race_adjustment = (11 - driver.wet_race) * 0.2 + 2
    else
      wet_race_adjustment = 0
    end

    driver_adjustment = driving_skills_adjustment + fitness_level_adjustment + wet_race_adjustment
  end

  def car_adjustment(car, circuit)
    # Adjust the lap time based on the car's performance
    gearbox_adjustment = (11 - car.gearbox) * (circuit_corners(circuit) + circuit_straights(circuit)) * 0.001
    suspension_adjustment = (11 - car.suspension) * (circuit_corners(circuit) + circuit_straights(circuit))* 0.002
    downforce_adjustment = (11 - car.downforce) * (circuit_corners(circuit) + circuit_straights(circuit)) * 0.003

    car_adjustment = gearbox_adjustment + suspension_adjustment + downforce_adjustment
  end

  def set_team_defaults
    self.team_a_id = Team.find(1).id
    self.team_b_id = Team.find(2).id
    self.team_c_id = Team.find(3).id
    self.team_d_id = Team.find(4).id
    self.team_e_id = Team.find(5).id
    self.team_f_id = Team.find(6).id
    self.team_g_id = Team.find(7).id
    self.team_h_id = Team.find(8).id
    self.team_i_id = Team.find(9).id
    self.team_j_id = Team.find(10).id
  end

  def set_weather
    self.weather
    if self.weather.nil?
      weather_variations = ['Sunny', 'Cloudy', 'Rainny']
      dice = rand(0..2)
      weather = weather_variations[dice]
      self.weather = weather
    else
      self.weather
    end
  end

  def set_status
    self.status = 'Not Started'
  end
end
